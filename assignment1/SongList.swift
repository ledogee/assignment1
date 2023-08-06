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

    var body: some View {
        NavigationView {
            List {
                if searchResults.isEmpty {
                    Text("Sorry, we cannot find your result!")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                } else {
                    ForEach(searchResults) { song in
                        CustomNavigationLink(song: song)
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
        }
        .navigationBarTitle("Top Songs")
    }

    var searchResults: [Song] {
        if searchText.isEmpty {
            return songs
        } else {
            return songs.filter { $0.title.contains(searchText) }
        }
    }
}

struct CustomNavigationLink: View {
    var song: Song

    var body: some View {
        NavigationLink(destination: SongView(song: song)) {
            HStack {
                // 1x Image on the left
                Image("\(song.title) square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40) // Set the appropriate size for the image

                // Song Title and Artist on the right
                VStack(alignment: .leading, spacing: 4) {
                    Text(song.title)
                        .font(.headline)
                        .lineLimit(1) // Limit the title to one line
                    Text(song.artist)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1) // Limit the artist name to one line
                }
            }
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView()
    }
}
