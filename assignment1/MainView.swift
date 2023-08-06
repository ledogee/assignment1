import SwiftUI

struct MainView: View {
    @State private var isInfoVisible = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background Picture
                Image("backgroundpic")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Top 30 in the Billboard")
                        .font(.custom("NHaasGroteskTXPro", size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1.85)
                        .padding(.top, 40)
                        .padding(.bottom, 35)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    // Custom styled NavigationLink
                    NavigationLink(destination: SongListView()) {
                        Text("Explore").foregroundColor(.black).font(.custom("NHaasGroteskTXPro", size: 20)).fontWeight(.bold)
                            .frame(width: 150, height: 60).background(ZStack{
                                RoundedRectangle(cornerRadius: 40, style: .continuous).foregroundColor(.white)
                            }).clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    }.offset(y:110)
                    .frame(maxWidth: .infinity) // Make the button expand to full width
                    
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
                    Text("Name: Luong Gia Bao")
                    Text("SId: 3915203")
                    
                    Spacer()
                    
                    Button("Dismiss") {
                        isInfoVisible.toggle()
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding().frame(height:100)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
