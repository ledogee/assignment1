//
//  SongView.swift
//  assignment1
//
//  Created by Bao Luong Gia on 04/08/2023.
//

import SwiftUI
let samplesong = songs[1]

struct SongView: View {
    let song: Song
    @State private var isShowingExtraView = false

    var body: some View {
        VStack {
            Text("Title: \(song.title)")
            Text("Artist: \(song.artist)")
            Text("Rank: \(song.rank)")
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
                View3()
            })
            // Add any other song details you want to display in the detail view
        }
        .navigationBarTitle("\(song.title)", displayMode: .inline)
    }
}
struct Extraview: View{
    var body:some View{
        Text("this is view 3")
    }
}
