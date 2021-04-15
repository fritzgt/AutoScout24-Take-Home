//
//  FruitController.swift
//  AutoScout24 Take Home
//
//  Created by FGT MAC on 4/14/21.
//

import Foundation


class FruitController {
    
    enum HTTPMethods: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    
    //Construct URL
    private let baseURL = URL(string: "https://gist.githubusercontent.com")!
    private lazy var fruitsURL = URL(string: "gcbrueckmann/0484975ede56eeb7fba6e143aab7df0f/raw/edfb73c8ade674f40bfff8f3dfed97d327c1abc1/fruits.json",relativeTo: baseURL)!
    
    //Properties
    var fruits: [Fruit] = []
    
    
    //API Call
    func getFruits(completion: @escaping () -> Void ) {
        
        var requestURL = URLRequest(url: fruitsURL)
        requestURL.httpMethod = HTTPMethods.get.rawValue
        
        URLSession.shared.dataTask(with: requestURL) { [weak self] (data, _, error) in
            
            if let error = error {
                completion()
                print("Data task error: \(error)")
                return
            }
            
            guard let self = self else {
                 return
            }
            
            
            guard let data = data else {
                print("No data returned from data task")
                completion()
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
           
            do{
                let fruitResults = try jsonDecoder.decode(FruitsResults.self, from: data)
                self.fruits.append(contentsOf: fruitResults.fruits)
                completion()
            }catch{
                print("Error decoding data")
                completion()
            }
            
            
        }.resume()
    }
    
    
}

