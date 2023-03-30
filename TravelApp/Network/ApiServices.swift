//
//  ApiServices.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 3/2/23.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getDiscoverData(completion: @escaping (Result<PlanetssData, Error>) -> Void) {
        
        let discoverPlanetsURL = "https://run.mocky.io/v3/42803f79-a4a9-4496-a231-b842462b0be7"
        
        guard let url = URL(string: discoverPlanetsURL) else {return}
        
        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(PlanetssData.self, from: data)
                
                // Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()

    }

}

