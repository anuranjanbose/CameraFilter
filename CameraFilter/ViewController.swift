//
//  ViewController.swift
//  CameraFilter
//
//  Created by Anuranjan Bose on 12/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var applyFilterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.applyFilterButton.isHidden = true
        // Do any additional setup after loading the view.
    }


}

