//
//  EyeshadowViewController.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import UIKit

class EyeshadowViewController: UITableViewController {

    private var eyeshadows: [Cosmetic.Eyeshadow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 406
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eyeshadows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eyeshadowCell", for: indexPath) as! EyeshadowCell
        let eyeshadow = eyeshadows[indexPath.row]
        
        cell.configureCell(with: eyeshadow)
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let eyeshadow = eyeshadows[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: eyeshadow)
    }
  
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? EyeshadowInfoViewController else { return }
        descriptionVC.eyeshadow = sender as? Cosmetic.Eyeshadow
    }

}
    // MARK: - Networking
extension EyeshadowViewController {
    func fetchEyeshadows() {
        guard let url = URL(string: CosmeticsData.shared.eyeShadowJSON ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.eyeshadows = try JSONDecoder().decode([Cosmetic.Eyeshadow].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }

        }.resume()
    }
}

