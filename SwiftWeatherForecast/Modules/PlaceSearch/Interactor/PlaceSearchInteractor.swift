//
// Created by Lucio Fonseca
// Copyright (c) 2017 Lucio. All rights reserved.
//

import Foundation

class PlaceSearchInteractor: PlaceSearchInteractorInputProtocol {
    weak var presenter: PlaceSearchInteractorOutputProtocol?
    var apiDataManager: PlaceSearchAPIClientProtocol?
    var localDatamanager: PlaceSearchLocalDataManagerInputProtocol?

    init() {}

    func searchPlaces(searchKey:String, completion: @escaping (_ response: [PlaceSearchItem]) -> Swift.Void) {
        apiDataManager?.fetchPlaces(searchKey: searchKey, completion: { (response:PlaceSearchResults?, error:Error?) in
            var array = [PlaceSearchItem]()

            //In the first version of this app we don't handle the errors. In case of errors we simply
            //Return an empty array.

            if error == nil, let searchResults = response?.places {
                for result in searchResults {
                    //Here we "convert" Unbox object to pure plain object just to follow the Viper Guidelines
                    //That recommends using Entities as Plain Objects to avoid any possible problem
                    array.append(PlaceSearchItem(place: result))
                }
            }
            completion(array)

        })
    }
}
