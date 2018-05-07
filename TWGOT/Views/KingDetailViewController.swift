//
//  KingDetailViewController.swift
//  TWGOT
//
//  Created by mac on 07/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import UIKit

class KingDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var kingDetail : King!
    let detailViewModel = KingDetailListViewModel()

    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var baseStackView: UIStackView!
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.kingInfo = self.kingDetail
        detailViewModel.displayDetailInformation()
        self.title = detailViewModel.kingInfo.name
        self.sigilImageView.image = UIImage.init(named: detailViewModel.kingInfo.sigilImage!) 
    }
    override func viewDidLayoutSubviews() {
        if self.view.frame.width > self.view.frame.height{
           self.baseStackView.axis = .horizontal
            self.baseStackView.alignment = .top
        }
        else{
            self.baseStackView.axis = .vertical
            self.baseStackView.alignment = .center

        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? detailViewModel.kingDetailsInfoNames.count : detailViewModel.displayBattleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailList", for: indexPath) as! KingsDetailListTableViewCell
            cell.textLabel?.text = detailViewModel.kingDetailsInfoNames[indexPath.row]
            cell.detailTextLabel?.text = "\(detailViewModel.detailsInfo[indexPath.row])"
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BattleList", for: indexPath) as! KingBattleListCell
            let battle = detailViewModel.displayBattleList[indexPath.row]
            cell.textLabel?.text = battle["name"]
            cell.detailTextLabel?.text = battle["opponent"]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerView") as! KingBattleListHeaderCell
            headerCell.textLabel?.text = "Wars"
            return headerCell
        }
        return UITableViewCell()
    }

}
