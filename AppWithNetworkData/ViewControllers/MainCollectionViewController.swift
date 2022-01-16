//
//  MainCollectionViewController.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import UIKit

private let reuseIdentifier = "categoryCell"

class MainCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    
    private let categories = UserAction.allCases

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEyeshadow" {
            let eyeshadowVC = segue.destination as! EyeshadowViewController
            eyeshadowVC.fetchEyeshadows()
        } else {
            let lipstickVC = segue.destination as! LipstickViewController
            lipstickVC.fetchLipsticks()
        }
    }
    

    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCell
        cell.categoryLabel.text = categories[indexPath.item].rawValue
        cell.categoryPhoto.image = UIImage(named: categories[indexPath.item].rawValue)
    
        return cell
    }

    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = categories[indexPath.item]
        
        switch userAction {
        case .eyeshadow: performSegue(withIdentifier: "showEyeshadow", sender: nil)
        case .lipstick: performSegue(withIdentifier: "showLipstick", sender: nil)
        }
    }
   
    
    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 40, height: 270)
    }
}
