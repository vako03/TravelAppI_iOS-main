//
//  FetchImageURL.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 3/9/23.
//

import UIKit

class FetchImageURL{
    
    init(){}
    
    func setImageToImageView(imageContainer: UIImageView, imageUrl: String) {
        FetchData().fetchImage(from: imageUrl, completionHandler: { (imageData) in
            if let data = imageData {
                // referenced imageView from main thread
                // as iOS SDK warns not to use images from
                // a background thread
                DispatchQueue.main.async {
                    imageContainer.image = UIImage(data: data)
                    CellDesign().setViewRounded(view: imageContainer, 0.05)
                }
            } else {
                // show as an alert if you want to
                print("Error loading image")
            }
        })
    }
    
    func setDetailImageToImageView(imageContainer: UIImageView, imageUrl: String) {
        FetchData().fetchImage(from: imageUrl, completionHandler: { (imageData) in
            if let data = imageData {
                // referenced imageView from main thread
                // as iOS SDK warns not to use images from
                // a background thread
                DispatchQueue.main.async {
                    imageContainer.image = UIImage(data: data)
                    DetailViewController.init().setImageRounded(imageContainer)
                }
            } else {
                // show as an alert if you want to
                print("Error loading image")
            }
        })
    }
    
}
