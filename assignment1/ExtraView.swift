import SwiftUI

struct Extraview: View {
    @Binding var isShowingSheet: Bool
    var song: Song // Assuming you have a Song struct with properties for Spotify, Apple, and YouTube links
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Button(action: {
                        // Handle Spotify link here
                        openURL(song.spotify_link)
                    }) {
                        Image("Spotify") // Replace with your Spotify icon image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                    }
                    Spacer()
                    Button(action: {
                        // Handle Apple Music link here
                        openURL(song.apple_link)
                    }) {
                        Image("Apple") // Replace with your Apple Music icon image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                    }
                    Spacer()
                    Button(action: {
                        // Handle YouTube link here
                        openURL(song.youtube_link)
                    }) {
                        Image("Youtube") // Replace with your YouTube icon image name
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                    }
                    Spacer()
                }
                Button("Dismiss") {
                    isShowingSheet.toggle()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .frame(height: geometry.size.height * 0.1) // (25% of the screen height)
            .padding()
            .offset(y: isShowingSheet ? 40 : geometry.size.height) // Slide the sheet up or down based on isShowingSheet
            .transition(.move(edge: .bottom))
            .animation(.spring())
        }
    }
    
    // Function to open URLs
    private func openURL(_ urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}
