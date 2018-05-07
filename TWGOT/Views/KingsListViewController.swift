//
//  KingsListViewController.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import UIKit

protocol DatasourceDelegate {
    func updatedDatesource()
}

class KingsListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,DatasourceDelegate {
    
    let kingsListViewModel = KingsListViewModel()

    @IBOutlet weak var kingsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kingsListViewModel.viewDelegate = self
        kingsListViewModel.getListOfBattles()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return kingsListViewModel.kings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "kingsRatings", for: indexPath) as! KingsListTableViewCell
       let king = kingsListViewModel.kings[indexPath.row]
       cell.kingNameLabel.text = king.name
       cell.ratingsLabel.text = String(format: "%.2f", king.ratingScore)
        cell.victoryScoreLabel.text = "\(king.victories)"
        cell.attacksScoreLabel.text = "\(king.attacks)"
        cell.defendsScoreLabel.text =  "\(king.defends)"
        cell.kingLogo.image = UIImage.init(named: king.sigilImage!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kingDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "KingDetailView") as! KingDetailViewController
        kingDetailViewController.kingDetail = kingsListViewModel.kings[indexPath.row]
        self.navigationController?.pushViewController(kingDetailViewController, animated: true)
    }
    
    
    func updatedDatesource() {
        DispatchQueue.main.async {
            self.kingsListTableView.reloadData()
        }
    }
}
