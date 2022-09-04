//
//  WebServices.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import Foundation



let urlForNow = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?limit=10&rapidapi-key=ecbbd1da42mshf82b196f1fc1d61p1d5bb1jsn800e0c14ca4d"




enum CountryError : Error {
    case noDataAvailable
    case cannotProcessData
}

struct WebServices{

    func getCountry(completion: @escaping(Result<[Country],CountryError>) -> Void  ){
            guard let url = URL(string: urlForNow) else {return}
            let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do{
                    let decoder = JSONDecoder()
                    let countryResult = try decoder.decode(Data.self, from: jsonData)
                    
                    let countries = countryResult.data
                    completion(.success(countries))
                }catch{
                    completion(.failure(.cannotProcessData))
                }
            }
            dataTask.resume()
        }
    
    func getCountryDetail(countryCode: String,completion: @escaping(Result<CountryDetail,CountryError>) -> Void  ){
        let urlDetail = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(countryCode)?rapidapi-key=ecbbd1da42mshf82b196f1fc1d61p1d5bb1jsn800e0c14ca4d"
            guard let url = URL(string: urlDetail) else {return}
            let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do{
                    let decoder = JSONDecoder()
                    let countryDetailResult = try decoder.decode(Response.self, from: jsonData)
                    let countryDetail = countryDetailResult.data
                    completion(.success(countryDetail))
                }catch{
                    completion(.failure(.cannotProcessData))
                }
            }
            dataTask.resume()
        }

}
