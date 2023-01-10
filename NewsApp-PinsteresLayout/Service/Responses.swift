//
//  Responses.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//

import Foundation
struct Responses {
    func getTopheadlinesTr(completion: @escaping(News?,Error?)->()) {
        Network.shared.fetchGeneric(urlString: Endpoints.topHeadlineTR.stringUrl, completion: completion)
    }
}
