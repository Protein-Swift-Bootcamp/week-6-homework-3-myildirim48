//
//  NewsModel.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//
import Foundation

// MARK: - News
struct News: Decodable {
    let status: String
     let totalResults: Int
     let articles: [NewsResult]
}


// MARK: - ResultClass
struct NewsResult: Decodable {
     let title, description: String
     let url: String
     let urlToImage: String
}
