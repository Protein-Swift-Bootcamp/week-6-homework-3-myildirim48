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
case sport
case science
case health
case bussines
    
    var toplines : String {
        urlBase + topHeadlines + country
    }
    var apikeylast : String {
        apiKey + secretKey.key
    }
    var stringUrl : String {
        switch self {
        case .topHeadlineTR :
            return toplines + apiKey + secretKey.key
        case .sport :
            return toplines + category + "sport" + apikeylast
        case .science :
            return toplines + category + "science" + apikeylast
        case .health:
            return toplines + category + "health" + apikeylast
        case .bussines :
            return toplines + category + "business" + apikeylast
        }
    }

}
