//
//  NewsModel.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? JSONDecoder().decode(News.self, from: jsonData)

import Foundation

// MARK: - News
struct News: Codable {
    let success: Bool
    let result: [ResultClass]
}


// MARK: - ResultClass
struct ResultClass: Codable {
    let key: String
    let url: String
    let description: String
    let image: String
    let name, source: String
}
