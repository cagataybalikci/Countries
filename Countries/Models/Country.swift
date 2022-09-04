//
//  Country.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import Foundation


struct Data : Codable {
    var data : [Country]
}

struct Country : Codable {
    var code : String
    var name : String
}
