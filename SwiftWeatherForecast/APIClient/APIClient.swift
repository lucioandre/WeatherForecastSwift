//
//  APIClient.swift
//  SwiftWeatherForecast
//
//  Created by Avenue Brazil on 19/07/17.
//  Copyright © 2017 Lucio Fonseca. All rights reserved.
//

import Foundation
import Alamofire
import Unbox

class APIClient : NSObject, PlaceSearchAPIClientProtocol, PlaceDetailedForecastAPIClientProtocol {
    let baseURL = "https://api.worldweatheronline.com"
    let apiKey = "80407676a49b4c94b66161329171407"

    //MARK: Search Protocol
    func fetchPlaces(searchKey: String, completion: @escaping (_ response: PlaceSearchResults?, _ error: Error?) -> Void) {
        let endPoint = "/premium/v1/search.ashx"
        let params = ["key" : apiKey,
                      "q" : searchKey,
                      "format" : "json",
                      "lang" : "en"]

        self.request(endPoint: endPoint, parameters: params, completion: { (response: [String : Any]?, error: Error?) in
            if error == nil {
                guard let json = response else {
                    completion(nil, nil)
                    return
                }

                do {
                    let searchResult: PlaceSearchResults = try unbox(dictionary: json)
                    completion(searchResult, nil)
                } catch {
                    completion(nil, nil)
                }
            } else {
                completion(nil, error)
            }
        })
    }

    //MARK: Details Protocol
    func fetchDetailedForecastForCoordinate(latitude: Float, longitude: Float, completion: @escaping (PlaceDetailedForecastAPIResult?, Error?) -> Void) {
        let endPoint = "/premium/v1/weather.ashx"
        let params = ["key" : apiKey,
                      "q" : "\(latitude),\(longitude)",
                      "format" : "json",
                      "num_of_days" : "10",
                      "tp" : "24",
                      "includeLocation" : "yes",
                      "lang" : "en"]

        self.request(endPoint: endPoint, parameters: params, completion: { (response: [String : Any]?, error: Error?) in
            if error == nil {
                guard let json = response else {
                    completion(nil, nil)
                    return
                }
                debugPrint(response)
                do {
                    let detailedForecast: PlaceDetailedForecastAPIResult = try unbox(dictionary: json)
                    completion(detailedForecast, nil)
                } catch {
                    completion(nil, nil)
                }
            } else {
                completion(nil, error)
            }
        })
    }

    //MARK: Private Method

    private func request(endPoint: String, method: HTTPMethod = .get, parameters: [String:Any], completion:@escaping (_ response: [String : Any]?, _ error: Error?) -> Swift.Void) {
        let urlString = baseURL + endPoint
        Alamofire.request(urlString, method:method, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success:
                completion(response.result.value as? [String : Any], nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
