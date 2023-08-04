import SwiftUI

struct MainView: View {
    @State private var isInfoVisible = false
    
    var body: some View {
        NavigationView{
            ZStack {
                // Background Picture
                Image("backgroundpic")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Top Songs in the Billboard")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding().font(.custom("neue-haas-grotesk-display", size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 16/255, green: 17/255, blue: 25/255))
                        .multilineTextAlignment(.center)
                        .lineSpacing(1.85)
                        .padding(.top, 40)
                        .padding(.bottom, 35)
                    
                    NavigationLink(destination: SongListView(),label: {
                        Text("Navigate").font(.headline)
                            .foregroundColor(.white)
                            .underline()
                            .padding()
                    })
                    .background(Color.clear) // Add clear background to make the button active
                    
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
