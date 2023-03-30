//
//  PlacesTableViewCell.swift
//  Travel App
//
//  Created by valeri mekhashishvili on 3/9/23.
//

import UIKit
class PlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var placesImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeLikes: UILabel!
    @IBOutlet weak var placeDetail: UILabel!
    @IBOutlet weak var placeBackground: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
