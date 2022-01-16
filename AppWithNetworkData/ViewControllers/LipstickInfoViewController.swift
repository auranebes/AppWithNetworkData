//
//  DescriptionViewController.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 16.01.2022.
//

import UIKit

class LipstickInfoViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    
    var lipstick: Cosmetic.Lipstick!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(with: lipstick)
    }
}

extension LipstickInfoViewController {
    func configureUI(with value: Cosmetic.Lipstick) {
        nameLabel.text = value.name
        brandLabel.text = value.brand
        descriptionLabel.text = value.description
        buyButton.setTitle("Buy \(value.price ?? "")\(value.price_sign ?? "")", for: .normal)
        
        DispatchQueue.global().async {
            guard let url = URL(string: "https:\(value.api_featured_image ?? "")" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageItem.image = UIImage(data: imageData)
            }
        }
    }
}
