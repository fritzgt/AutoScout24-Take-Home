//
//  FruitsModel.swift
//  AutoScout24 Take Home
//
//  Created by FGT MAC on 4/14/21.
//

import Foundation


struct Fruit: Codable {
    let name: String
    let price: Int
    let image: String
}


struct FruitsResults: Codable {
    let fruits: [Fruit]
}
