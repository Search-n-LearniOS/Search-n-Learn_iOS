//
//  APICaller.swift
//  APICaller
//
//  Created by Alex Henner on 11/15/21.
//

import Alamofire
import UIKit
import Parse

let url = URL(string: "https://api.gbif.org/v1/occurrence/search?decimalLatitude=42,46&decimalLongitude=-85,-80&hasCoordinate=true&limit=100&phylumKey=44")!

class SearchNLearnAPICaller {
    
    static func getCritters(success: @escaping ([Any]) -> (), failure: @escaping (Error) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                let species = jsonResponse as? [String: Any]//Response result
                let results = species!["results"] as? [NSDictionary]
                let animals = results! as NSArray
                var localAnimalArray = [] as Array
                for animal in animals {
                    let species = animal as! NSDictionary
                    for (key,value) in species {
                        if key as! String == "species" {
                            localAnimalArray.append(value as! String)
                        }
                    }
                }
                success(localAnimalArray as! [Any])
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
    }
    
    
    static func getWikiDictionary(animalName: String, success: @escaping ([Any]) -> (), failure: @escaping (Error) -> ()) {
        let wikiurl = URL(string: "https://en.wikipedia.org/w/api.php?format=json&action=query&titles=\(animalName)&prop=pageimages")!

        let task = URLSession.shared.dataTask(with: wikiurl) { (data, response, error) in
        guard let dataResponse = data,
              error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return}
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                let wiki = jsonResponse as? [String: Any]
                let results = wiki!["query"] as? [String: Any]
                let results2 = results!["pages"] as? [String: Any]
//                Need to find the page id for each animal somehow to replace the 4400
                let results3 = results2!["4400"] as? [String: Any]
//                print(results3!)
                let title = results3!["title"]! as? String
                let pageImage = results3!["pageimage"]! as? String
                let imageFile = "https://en.wikipedia.org/wiki/\(title!)#/media/File:\(pageImage!)"
                let imageUrl = URL(string: imageFile)!
                let info = [title!, imageUrl] as [Any]
                success(info as! [Any])

             } catch let parsingError {
                print("Error", parsingError)
                }
            }
        task.resume()
    }
}
