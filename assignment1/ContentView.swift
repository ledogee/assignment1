//
//  ContentView.swift
//  assignment1
//
//  Created by Bao Luong Gia on 24/07/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var isShowingView2 = false
    @State private var isShowingView3 = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    isShowingView2 = true
                }) {
                    Text("Go to View 2")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .sheet(isPresented: $isShowingView2, content: {
                    View2()
                })
                
                Button(action: {
                    isShowingView3 = true
                }) {
                    Text("Go to View 3")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(8)
                .sheet(isPresented: $isShowingView3, content: {
                    View3()
                })
            }
            .navigationBarTitle("View 1")
        }
    }
}

struct View1: View{
    var body:some View{
        Text("this is view 1")
    }
}
struct View2: View{
    var body:some View{
        Text("this is view 2")
    }
}
struct View3: View{
    var body:some View{
        Text("this is view 3")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

