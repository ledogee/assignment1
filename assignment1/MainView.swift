import SwiftUI

struct MainView: View {
    @State private var isInfoVisible = false
    
    var body: some View {
        ZStack {
            // Background Picture
            Image("backgroundpic")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Your Program Name")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                NavigationLink(destination: ContentView()) {
                    Text("Link to Program")
                        .font(.headline)
                        .foregroundColor(.white)
                        .underline()
                        .padding()
                }
                .buttonStyle(GradientButtonStyle())
                
                Spacer()
                
                // Info Button
                Button(action: {
                    isInfoVisible.toggle()
                }) {
                    Image(systemName: "info.circle")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                }
                .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove default button styling
            }
        }
        .sheet(isPresented: $isInfoVisible) {
            // Small Screen with Dismiss Button
            VStack {
                Text("Information")
                    .font(.title)
                    .padding()

                // Add your information here

                Spacer()

                Button("Dismiss") {
                    isInfoVisible.toggle()
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding()
        }
    }
}

// Custom button style to add decorations (gradient background)
struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
