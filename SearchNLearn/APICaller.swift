//
//  APICaller.swift
//  APICaller
//
//  Created by Alex Henner on 11/15/21.
//

import Alamofire
import UIKit

let url = URL(string: "https://api.gbif.org/v1/occurrence/search?decimalLatitude=42,46&decimalLongitude=-85,-80&hasCoordinate=true&limit=100&phylumKey=44")!

class SearchNLearnAPICaller {
    
    static func getCritters () {
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let dataResponse = data,
              error == nil else {
              print(error?.localizedDescription ?? "Response Error")
              return }
        do{
            let jsonResponse = try JSONSerialization.jsonObject(with:
                                   dataResponse, options: [])
            let species = ((jsonResponse as? [String: Any])?["results"] as? [String: Any])?["species"]//Response result
            print(species)
            
         } catch let parsingError {
            print("Error", parsingError)
       }
    
    
    
    func getWikiDictionary(animalName: String, success: @escaping ([NSDictionary]) -> (), failure: @escaping (Error) -> ()) {
        let url = URL(string: "https://en.wikipedia.org/w/api.php")!
        let parameters = [
            "action": "query",
            "titles": animalName,
            "format": "json",
            "prop": "images|info"
        ]
        AF.request(url, parameters: parameters).response { response in
            print(response)
        }
    }
    task.resume()
}
}
