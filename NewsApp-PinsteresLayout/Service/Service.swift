//
//  Service.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//
import Foundation

79869ad1782d433e93043eb097cac6a6

class Service {
    let headers = [
      "content-type": "application/json",
      "authorization": "apikey 0xCP2HLAeXBuWbVrmkX3Rh:0uuP2FhExfu1mtGlUFRwQd"
    ]

    var urlString = {
       return "https://api.collectapi.com/news/getNews?country=tr&tag="
    }
    
    enum newsType {
        case general
        case sport
        case technology
        
        switch news {
        case .general
        }
    }
    
    func loadData(){
        guard var url = URL(string: "\(urlString)" + "general") else { return }
        
        var request = URLRequest(url: url)

        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
              print(error!)
          } else {
            let httpResponse = response as? HTTPURLResponse
              print(httpResponse!)
          }
        })
        dataTask.resume()
    }
    
}
