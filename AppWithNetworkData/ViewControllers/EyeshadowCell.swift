//
//  EyeshadowTableViewCell.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import UIKit

class EyeshadowCell: UITableViewCell {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageEyeshadow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activity.hidesWhenStopped
        activity.startAnimating()
    }
    
    func configureCell(with eyeshadow: Cosmetic.Eyeshadow) {
        nameLabel.text = eyeshadow.name
        brandLabel.text = eyeshadow.brand
        priceLabel.text = eyeshadow.price
        
        DispatchQueue.global().async {
            guard let url = URL(string: "https:\(eyeshadow.api_featured_image ?? "")" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageEyeshadow.image = UIImage(data: imageData)
            }
        }
        activity.stopAnimating()
    }

}
