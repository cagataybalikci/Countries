//
//  CountryDetail.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import Foundation


struct Response : Codable {
    var data : CountryDetail
}

struct CountryDetail : Codable {
    var capital : String?
    var code : String?
    var flagImageUri : String?
    var name : String?
    var wikiDataId : String?
}
