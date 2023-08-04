//
//  SongList.swift
//  assignment1
//
//  Created by Bao Luong Gia on 04/08/2023.
//


import SwiftUI

struct SongListView: View {
    @AppStorage("isDark") private var isDark = false
    @State private var searchText = ""
    @State private var isOn = false
    
    var body: some View {
        NavigationView{
            List {
                if searchResults.isEmpty {
                    Text("Sorry, we cannot find your result!")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                } else {
                    ForEach(searchResults) { song in
                        NavigationLink(destination: SongView(song: song)) {
                            Text("Title: \(song.title)")
                            Text("Artist: \(song.artist)")
                        }
                        .navigationTitle("Song List")
                    }
                    .preferredColorScheme(isDark ? .dark : .light)
                }
            }
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: { isDark.toggle() }) {
                        isDark ? Label("Dark", systemImage: "sun.max.fill") : Label("Dark", systemImage: "moon.fill")
                    }
                }
            }
            .environment(\.colorScheme, isDark ? .dark : .light)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .background(Image("app-cover-background"))
        }.navigationBarTitle("Top Songs")
    }
    var searchResults: [Song] {
        if searchText.isEmpty{
            return songs
        } else {
            return songs.filter { $0.title.contains(searchText) }
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}
