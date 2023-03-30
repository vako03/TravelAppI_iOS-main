//
//  DiscoverViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 2/26/23.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var planets = [Planets]()
    private var apiService = ApiService()
    private var viewMoel = PlanetsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DiscoverCell", bundle: nil), forCellWithReuseIdentifier: DiscoverCell.identifier)
        loadDiscoevrPlanetsData()
    
        }
    
    private func loadDiscoevrPlanetsData() {
        fetchDiscoverPlanetsData { [weak self] in
            self?.collectionView.dataSource = self
            self?.collectionView.delegate = self
            self?.collectionView.reloadData()
        }
    }
    func fetchDiscoverPlanetsData(completion: @escaping () -> ()) {
        
        // weak self - prevent retain cycles
        apiService.getDiscoverData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.planets = listOf.planets
                completion()
            case .failure(let error):
                // Something is wrong with the JSON file or the model
                print("Error processing json data: \(error)")
            }
        }
    }
}


extension DiscoverViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        planets.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCell.identifier, for: indexPath) as! DiscoverCell
        
        let planet = planets[indexPath.row]
        cell.setCellWithValuesOf(planet)
        
        cell.animateImage() // add this line to animate the image
        
        return cell
    }
}


extension DiscoverViewController: UICollectionViewDelegate {
}

extension DiscoverViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 180, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
}
