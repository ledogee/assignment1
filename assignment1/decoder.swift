//
//  decoder.swift
//  assignment1
//
//  Created by Bao Luong Gia on 04/08/2023.
//

import Foundation

let songs = decodeJsonFile(jsonFileName: "data.json")

func decodeJsonFile(jsonFileName: String) -> [Song] {
    guard let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) else {
        fatalError("Couldn't find \(jsonFileName) file")
    }

    do {
        let data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decoded = try decoder.decode([Song].self, from: data)
        return decoded
    } catch {
        fatalError("Failed to decode JSON: \(error)")
    }
}
