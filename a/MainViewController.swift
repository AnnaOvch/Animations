//
//  MainViewController.swift
//  a
//
//  Created by Анна on 10.08.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var animal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = animal?.image
        self.label.text = animal?.name
    }
    

}
