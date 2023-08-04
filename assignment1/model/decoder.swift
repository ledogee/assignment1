//
//  decoder.swift
//  assignment1
//
//  Created by Bao Luong Gia on 04/08/2023.
//

import Foundation

let songs = decodeJsonFile(jsonFileName: "data")

func decodeJsonFile(jsonFileName: String) -> [Song] {
    guard let fileURL = Bundle.main.url(forResource: jsonFileName, withExtension: "json") else {
        fatalError("Couldn't find the file '\(jsonFileName).json'.")
    }

    do {
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let decoded = try decoder.decode([Song].self, from: data)
        return decoded
    } catch let error {
        fatalError("Failed to decode JSON: \(error)")
    }
}
