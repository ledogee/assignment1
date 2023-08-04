//
//  Song.swift
//  assignment1
//
//  Created by Bao Luong Gia on 04/08/2023.
//

import Foundation


struct Song: Codable, Identifiable {
    let rank: String
    let title: String
    let artist: String
    let last_week: String
    let peak_position: String
    let weeks_on_chart: String
//    let spotify_link: String
//    let youtube_link: String
//    let apple_link: String
    // Using rank as the unique identifier for Song
    var id: String { rank }
}
