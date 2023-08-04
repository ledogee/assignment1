//
//  Song.swift
//  assignment1
//
//  Created by Bao Luong Gia on 04/08/2023.
//

import Foundation


struct Song: Codable, Identifiable{
    let rank: String
    let title: String
    let artist: String
    let last_week: String
    let peak_position: String
    let weeks_on_chart: String
    var id: String{rank}
}
