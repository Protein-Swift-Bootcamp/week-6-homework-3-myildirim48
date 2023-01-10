//
//  Endpoints.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//

import Foundation
enum Endpoints {
    var urlBase : String {
        return "https://newsapi.org/v2/"
    }
case topHeadlineTR

    
    var stringUrl : String {
        switch self {
        case .topHeadlineTR :
            return urlBase + topHeadlines + country + apiKey + secretKey.key
        }
    }

}
