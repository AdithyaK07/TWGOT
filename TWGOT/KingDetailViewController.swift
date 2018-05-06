//
//  KingDetailViewController.swift
//  TWGOT
//
//  Created by mac on 07/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import UIKit

class KingDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var baseStackView: UIStackView!
    
    @IBOutlet weak var detailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        if self.view.frame.width > self.view.frame.height{
           self.baseStackView.axis = .horizontal
            //self.baseStackView.alignment = .trailing
        }
        else{
            self.baseStackView.axis = .vertical
           // self.baseStackView.alignment = .center

        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailList", for: indexPath) as! KingsDetailListTableViewCell
        return cell
    }
    


}
