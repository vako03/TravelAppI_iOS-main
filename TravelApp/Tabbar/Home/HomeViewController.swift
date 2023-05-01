//
//  HomeViewController.swift
//  TravelApp
//
//  Created by valeri mekhashishvili on 2/26/23.
//
import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet private weak var PlacesTableView: UITableView!
    @IBOutlet private weak var MenuCollectionView: UICollectionView!
    @IBOutlet private weak var popularHorizontallyScrollableStackView: UIStackView!
    @IBOutlet private weak var popularHorizontallyScrollView: UIScrollView!
    @IBOutlet private weak var viewHomeBanner: UIView!
    @IBOutlet private weak var viewSubHomeBanner: UIView!
    @IBOutlet private weak var imageUser: UIImageView!
    
    var loadingView: UIView?

    struct PropertyKeys {
        static let placesCell = "PlacesCell"
        static let showPlacesDetail = "ShowPlacesDetail"
    }
   
    private let url = "https://run.mocky.io/v3/1fece3fb-9c3b-4bf7-90aa-984e16ffbaf5"
    var placesSpace = APIData(){
        didSet{
            DispatchQueue.main.async {
                [self] in
                let filteredPopularData = placesSpace.places.filter {
                    recomendedPlace.contains($0.id)
                }
                for place in filteredPopularData {
                    if let popularView = Bundle.main.loadNibNamed("PopularContentView", owner: nil, options: nil)!.first as? PopularView {
                        CellDesign().setViewRoundedShadow(popularView.container, 0.05)
                        
                        FetchImageURL().setImageToImageView(imageContainer: popularView.placeImage, imageUrl: "\(String(describing: place.image))")
                        popularView.placeName.text = place.name
                        popularView.placeDetail.text = place.description
                        self.popularHorizontallyScrollableStackView.addArrangedSubview(popularView)
                    }
                }
                
                self.PlacesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        FetchData().fetchData(urlForFetchingData: url, completionHandler: {
            placesArray in self.placesSpace = placesArray
        })
        
        super.viewDidLoad()
        
        //set menu collection view
        MenuCollectionView.dataSource = self
        MenuCollectionView.reloadData()
        
        let screenWidth = MenuCollectionView.frame.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (screenWidth/4)-15, height: (screenWidth/4)-15)
        MenuCollectionView.collectionViewLayout = layout
        
        //set places table
        PlacesTableView.dataSource = self
        PlacesTableView.reloadData()
        
        //set others UI
        popularHorizontallyScrollView.showsHorizontalScrollIndicator = false
        CellDesign().setViewRounded(view: self.viewHomeBanner, 0.05)
        CellDesign().setViewRounded(view: self.viewSubHomeBanner, 0.05)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesSpace.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.placesCell, for: indexPath) as? PlacesTableViewCell {
            
            let place = placesSpace.places[indexPath.row]
            cell.placeName?.text = place.name
            cell.placeDetail.text = place.description
            cell.placeLikes.text = "\(String(describing: Int(place.like!) ))"
            FetchImageURL().setImageToImageView(imageContainer: cell.placesImage, imageUrl: "\(String(describing: place.image))")
            
            //make rounded
            cell.placesImage.clipsToBounds = true
            cell.placesImage.layer.cornerRadius = 20
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = PlacesTableView.indexPathForSelectedRow,
           segue.identifier == PropertyKeys.showPlacesDetail {
            let detailPlaceViewController = segue.destination as! DetailViewController

//            let filteredTableData = placesSpace.places.filter {
//                recomendedPlace.contains($0.id)
//            }

            detailPlaceViewController.place = placesSpace.places[indexPath.row]
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MenuItem",
            for: indexPath
          ) as! MenuCollectionViewCellController
          
        
        let data = menus[indexPath.row]
        cell.name.text = data.name
        let imageData = UIImage(named: data.name.lowercased())
        cell.imageView.image = imageData // setting your bear image here
            
        return cell
    }
    
}

