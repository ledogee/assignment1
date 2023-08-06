import SwiftUI
import AVFoundation

struct SongView: View {
    @State private var isShowingExtraView = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var currentTime: TimeInterval = 0
    @State private var isPlaying = false
    
    // Assuming you have a song object with properties: title, artist, rank, and imageName
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
                    if let duration = audioPlayer?.duration {
                        Slider(value: $currentTime, in: 0...duration, step: 0.1)
                            .accentColor(.green)
                    } else {
                        Slider(value: $currentTime, in: 0...0.1, step: 0.1)
                            .accentColor(.green)
                    }
                    
                }
                .padding()
                
                // Share Button
                Button(action: {
                    isShowingExtraView = true
                }) {
                    Text("Share")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(8)
                .sheet(isPresented: $isShowingExtraView, content: {
                    Extraview()
                })
            }
            .padding()
            .navigationBarTitle("\(song.title)", displayMode: .inline)
        }
        .onAppear {
            // Load the audio file
            if let audioURL = Bundle.main.url(forResource: song.title, withExtension: "mp3", subdirectory: "model/audio") {
                print("Audio URL: \(audioURL)")
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
        }
        .onDisappear {
            // Stop the audio player when the view disappears
            audioPlayer?.stop()
        }
        .onChange(of: currentTime) { newValue in
            // Update the audio player's current time when the slider value changes
            audioPlayer?.currentTime = newValue
        }
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
            // Update the slider's value with the current time of the audio player
            currentTime = audioPlayer?.currentTime ?? 0
        }
    }
}
struct Extraview: View {
    var body: some View {
        Text("There is nothing here yet")
    }
}
