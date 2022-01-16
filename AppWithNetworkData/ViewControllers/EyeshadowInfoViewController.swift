//
//  EyeshadowInfoViewController.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 17.01.2022.
//

import UIKit

class EyeshadowInfoViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var eyeshadow: Cosmetic.Eyeshadow!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(with: eyeshadow)
    }
}

extension EyeshadowInfoViewController {
    
    func configureUI(with value: Cosmetic.Eyeshadow) {
        nameLabel.text = eyeshadow.name
        brandLabel.text = eyeshadow.brand
        descriptionLabel.text = eyeshadow.description
        buyButton.setTitle("Buy \(value.price ?? "")\(value.price_sign ?? "")", for: .normal)
        
        DispatchQueue.global().async {
            guard let url = URL(string: "https:\(self.eyeshadow.api_featured_image ?? "")" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageItem.image = UIImage(data: imageData)
            }
        }
    }
}

