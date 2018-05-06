//
//  KingsListViewController.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import UIKit

class KingsListViewController: UIViewController {
    let kingsListViewModel = KingsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        kingsListViewModel.getListOfBattles()
    }



}
