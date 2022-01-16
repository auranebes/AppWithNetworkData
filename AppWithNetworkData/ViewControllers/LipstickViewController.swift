//
//  LipstickViewController.swift
//  AppWithNetworkData
//
//  Created by Arslan Abdullaev on 15.01.2022.
//

import UIKit

class LipstickViewController: UITableViewController {
    
    private var lipsticks: [Cosmetic.Lipstick] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 406
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lipsticks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lipstickCell", for: indexPath) as! LipstickCell
        let lipstick = lipsticks[indexPath.row]
        
        cell.configureCell(with: lipstick)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let lipstick = lipsticks[indexPath.row]
        performSegue(withIdentifier: "showDetailsLip", sender: lipstick)
    }
  
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? DescriptionViewController else { return }
        descriptionVC.lipstick = sender as? Cosmetic.Lipstick
    }
}

extension LipstickViewController {
    func fetchLipsticks() {
        guard let url = URL(string: CosmeticsData.shared.lipstickJSON ) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.lipsticks = try JSONDecoder().decode([Cosmetic.Lipstick].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }

        }.resume()
    }
}

