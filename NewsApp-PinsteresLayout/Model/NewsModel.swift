//
//  NewsModel.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//
import Foundation

// MARK: - News
struct News: Codable {
    let success: Bool
    let result: [NewsResult]
}


// MARK: - ResultClass
struct NewsResult: Codable {
    let key: String
    let url: String
    let description: String
    let image: String
    let name, source: String
}
