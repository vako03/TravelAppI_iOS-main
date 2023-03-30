//
//  ColorCell.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 3/2/23.
//

import UIKit

class DiscoverCell: UICollectionViewCell {
    
    static let identifier = "DiscoverCell"
    @IBOutlet private weak var planetPoster: UIImageView!
    @IBOutlet private weak var planetTitle: UILabel!
    
    func animateImage() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.planetPoster.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseInOut], animations: {
                self.planetPoster.transform = .identity
            }, completion: nil)
        }
    }

    private  var urlString: String = ""
    func setCellWithValuesOf(_ planet:Planets) {
        updateUI(poster: planet.posterImage, title: planet.title, raiting: planet.rate)
    }
    
    private func updateUI(poster: String?, title: String?, raiting: Double?) {
        
        self.planetTitle.text = title
        guard let posterString = poster else {return}
        urlString = "https://i.pinimg.com/564x" + posterString
        guard let posterImageURL = URL(string: urlString) else {
            self.planetPoster.image = UIImage(named: "ic_imageno")
            return
        }
        self.planetPoster.image = nil
        getImageDataFrom(url: posterImageURL)
    }
    
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("DaraTask: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async{
                if let image = UIImage(data: data){
                    self.planetPoster.image = image
                }
            }
        }.resume()
    }
}
