import SwiftUI
import AVFoundation

struct SongView: View {
    @State private var isShowingExtraView = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var currentTime: TimeInterval = 0
    @State private var isPlaying = false
    @State private var timer: Timer?
    
    var song: Song
    var body: some View {
        ZStack {
            // Background Image
            if let backgroundImage = UIImage(named: song.title) {
                Image(uiImage: backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(isShowingExtraView ? 0.6 : 1)
                    .blur(radius: 10)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
                
            }
            
            VStack {
                if let mainImage = UIImage(named: song.title){
                    Image(uiImage: mainImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("Title: \(song.title)")
                        .foregroundColor(.white) // Set text color to white for better visibility
                    Divider()
                    Text("Artist: \(song.artist)")
                        .foregroundColor(.white) // Set text color to white for better visibility
                    Divider()
                    Text("Rank: \(song.rank)")
                        .foregroundColor(.white)
                    Divider()
                    Text("Peak position: \(song.peak_position)")
                        .foregroundColor(.white)
                    Divider()
                    Text("Weeks on chart: \(song.weeks_on_chart)")
                        .foregroundColor(.white)
                }
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(Color.white.opacity(0.7)) // Lower opacity here
                        .cornerRadius(8)
                )
                
                HStack {
                    Button(action: {
                        // Play or Pause the audio
                        if isPlaying {
                            audioPlayer?.pause()
                        } else {
                            audioPlayer?.play()
                        }
                        isPlaying.toggle()
                    }) {
                        Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                    }
                    
                    let currentTimeString = String(format: "%02d:%02d", Int(currentTime / 60), Int(currentTime) % 60)
                    Text(currentTimeString)
                        .foregroundColor(.green)
                        .frame(width: 50)
                        .multilineTextAlignment(.leading)
                        .animation(nil) // Disable animation for text updates
                    
                    if let duration = audioPlayer?.duration {
                        Slider(value: $currentTime, in: 0...duration, step: 0.1)
                            .accentColor(.green)
                            .disabled(true) // Disable slider interaction
                    } else {
                        Slider(value: $currentTime, in: 0...0.1, step: 0.1)
                            .accentColor(.green)
                            .disabled(true) // Disable slider interaction
                    }
                    
                }
                .padding()
                
                // Share Button
                if !isShowingExtraView {
                                    Button(action: {
                                        isShowingExtraView.toggle()
                                    }) {
                                        Text("Share")
                                    }
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        isShowingExtraView.toggle()
                                    }
                                }
                if isShowingExtraView {
                    Extraview(isShowingSheet: $isShowingExtraView, song: song).opacity(1)
                                }
            }
            .padding()
            .navigationBarTitle("\(song.title)", displayMode: .inline)
        }
        .onAppear {
            // Load the audio file
            if let audioURL = Bundle.main.url(forResource: song.title, withExtension: "mp3") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                    audioPlayer?.prepareToPlay()
                } catch {
                    print("Error loading audio file: \(error.localizedDescription)")
                }
            } else {
                print(song.title)
                print("Audio file not found.")
            }
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                currentTime = audioPlayer?.currentTime ?? 0
                        }
        }
        .onDisappear {
            // Stop the audio player when the view disappears
            audioPlayer?.stop()
        }
        .onChange(of: currentTime) { newValue in
            // Update the audio player's current time when the slider value changes
            audioPlayer?.currentTime = newValue
        }
    }
}
