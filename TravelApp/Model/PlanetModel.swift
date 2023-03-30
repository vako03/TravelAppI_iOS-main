//
//  PlanetsViewModel.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 3/2/23.
//

import Foundation


class PlanetsViewModel {
    
    private var apiService = ApiService()
    private var discoverPlanets = [Planets]()
    
    func fetchDiscoverPlanetsData(completion: @escaping () -> ()) {
        
        // weak self - prevent retain cycles
        apiService.getDiscoverData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.discoverPlanets = listOf.planets
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        discoverPlanets.count
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Planets {
        return discoverPlanets[indexPath.row]
    }
}
