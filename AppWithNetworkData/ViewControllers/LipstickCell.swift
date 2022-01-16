//
//  LipstickCell.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import UIKit

class LipstickCell: UITableViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLipstick: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with lipstick: Cosmetic.Lipstick) {
        nameLabel.text = lipstick.name
        brandLabel.text = lipstick.brand
        priceLabel.text = lipstick.price
        
        DispatchQueue.global().async {
            guard let url = URL(string: "https:\(lipstick.api_featured_image ?? "")" ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageLipstick.image = UIImage(data: imageData)
            }
        }
    }

}
