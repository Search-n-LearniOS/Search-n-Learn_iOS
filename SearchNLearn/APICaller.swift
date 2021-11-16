//
//  APICaller.swift
//  APICaller
//
//  Created by Alex Henner on 11/15/21.
//

import Alamofire
import UIKit

class SearchNLearnAPICaller {
    
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
}
