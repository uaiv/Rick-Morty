//
//  LocationsRequest.swift
//  Rick&Morty
//
//  Created by Ivan Zakharchenko on 03/06/2022.
//

import Foundation

extension Request {
    
    final class Location {
        
        class func fire(url: String?, completion: @escaping((LocationResponseObject) -> Void)) {
            
            let urlLocation = url ?? "https://rickandmortyapi.com/api/location"
            
            let sessionConfiguration = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfiguration,
                                     delegate: nil,
                                     delegateQueue: nil)
            guard let url = URL(string: urlLocation) else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                if error == nil {
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                    print("TRYING TO DECODE DATA:")
                    let decoder = JSONDecoder()
                    if let data = data {
                        do {
                            let decodedObject = try decoder.decode(LocationResponseObject.self, from: data)
                            completion(decodedObject)
                            print("DECODED \(LocationResponseObject.self) SUCCESSFULLY")
                            print(decodedObject)
                        } catch let DecodingError.dataCorrupted(context) {
                            print(context)
                        } catch let DecodingError.keyNotFound(key, context) {
                            print("Key '\(key)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.valueNotFound(value, context) {
                            print("Value '\(value)' not found:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch let DecodingError.typeMismatch(type, context)  {
                            print("Type '\(type)' mismatch:", context.debugDescription)
                            print("codingPath:", context.codingPath)
                        } catch {
                            print("error: ", error)
                        }
                    }
                } else {
                    print("URL Session Task Failed: %@", error!.localizedDescription)
                }
                log(response: response as? HTTPURLResponse, data: data, error: error)
            }
            task.resume()
            session.finishTasksAndInvalidate()
        }
        
    }
    
}

