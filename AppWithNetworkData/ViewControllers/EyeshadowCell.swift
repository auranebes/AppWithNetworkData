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
    
    func configureCell(with eyeshadow: Cosmetic.Eyeshadow) {
        nameLabel.text = eyeshadow.name
        brandLabel.text = eyeshadow.brand
        priceLabel.text = "\(eyeshadow.price ?? "")\(eyeshadow.price_sign ?? "")"
        activity.hidesWhenStopped = true
        self.activity.startAnimating()
        
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
