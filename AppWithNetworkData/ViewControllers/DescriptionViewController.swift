//
//  DescriptionViewController.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 16.01.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var eyeshadow: Cosmetic.Eyeshadow!
    var lipstick: Cosmetic.Lipstick!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUILipstick(with: lipstick)
    }
}

extension DescriptionViewController {
    func configureUILipstick(with value: Cosmetic.Lipstick) {
        nameLabel.text = value.name
        brandLabel.text = value.brand
        descriptionLabel.text = value.description
        buyButton.titleLabel?.text = "Buy \(value.price ?? "")\(value.price_sign ?? "")"
        
        DispatchQueue.global().async {
            guard let url = URL(string: "https:\(value.api_featured_image ?? "")" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageItem.image = UIImage(data: imageData)
            }
        }
        
    }
    
    func configureUIEyeshadow(with value: Cosmetic.Eyeshadow) {
        nameLabel.text = eyeshadow.name
        brandLabel.text = eyeshadow.brand
        descriptionLabel.text = eyeshadow.description
        buyButton.titleLabel?.text = "Buy \(eyeshadow.price ?? "")\(eyeshadow.price_sign ?? "")"
        
        DispatchQueue.global().async {
            guard let url = URL(string: "https:\(self.eyeshadow.api_featured_image ?? "")" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageItem.image = UIImage(data: imageData)
            }
        }
    }
}
