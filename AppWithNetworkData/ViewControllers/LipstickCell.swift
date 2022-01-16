//
//  LipstickCell.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import UIKit

class LipstickCell: UITableViewCell {
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLipstick: UIImageView!
    
    func configureCell(with lipstick: Cosmetic.Lipstick) {
        nameLabel.text = lipstick.name
        brandLabel.text = lipstick.brand
        priceLabel.text = "\(lipstick.price ?? "")\(lipstick.price_sign ?? "")"
        activity.hidesWhenStopped = true
        self.activity.startAnimating()
        
        DispatchQueue.global().async {
            guard let url = URL(string: "https:\(lipstick.api_featured_image ?? "")" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageLipstick.image = UIImage(data: imageData)
            }
        }
        activity.stopAnimating()
    }

}
