//
//  Service.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//
import Foundation



class Network {
    //Declare json by generic
    
    static let shared = Network()
    
    func fetchData(completion:@escaping(News?,Error?)->()) {
        fetchGeneric(urlString: Endpoints.topHeadlineTR.stringUrl, completion: completion)
    }
    
    func fetchSport(completion:@escaping(News?,Error?)->()) {
        fetchGeneric(urlString: Endpoints.sport.stringUrl, completion: completion)
    }
    func fetchHealth(completion:@escaping(News?,Error?)->()) {
        fetchGeneric(urlString: Endpoints.health.stringUrl, completion: completion)
    }
    func fetchScience(completion:@escaping(News?,Error?)->()) {
        fetchGeneric(urlString: Endpoints.science.stringUrl, completion: completion)
    }
    func fetchBussines(completion:@escaping(News?,Error?)->()) {
        fetchGeneric(urlString: Endpoints.bussines.stringUrl, completion: completion)
    }
    
    
    func fetchGeneric<T:Decodable>(urlString:String, completion: @escaping (T?,Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                completion(nil,err)
                print("Error while fetching data at Service",err)
            }
            do{
                let objects = try JSONDecoder().decode(T.self, from: data!)
                //Success
                completion(objects,nil)
            }catch{
                completion(nil,err)
            }
      }.resume()
    }
    
}
