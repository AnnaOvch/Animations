//
//  AuthorizationViewController.swift
//  a
//
//  Created by Анна on 10.08.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit
class AuthorizationViewController: UIViewController {
    

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
   
    
    let array = [
        Animal(name: "Raccoon", image: UIImage(named: "profile0")!),
        Animal(name: "Dog", image: UIImage(named: "profile1")!),
        Animal(name: "Hamster", image: UIImage(named: "profile2")!),
        Animal(name: "Cat", image: UIImage(named: "profile3")!)
    ]
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = array[count].image
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = myImageView.frame.height/2
        myLabel.text = array[count].name
         
    }
    @IBAction func backButton(_ sender: UIButton) {
        sender.makePulse()
        if count>0 {
            count = count-1
            myImageView.image = array[count].image
            myLabel.text = array[count].name
             UIView.transition(with: myImageView, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
    @IBAction func nextButton(_ sender: UIButton) {
        sender.makePulse()
        if count<3 {
            count = count+1
            myImageView.image = array[count].image
            myLabel.text = array[count].name
            UIView.transition(with: myImageView, duration: 0.6, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    @IBAction func logInButton(_ sender: Any) {
        if array[count].name == myTextField.text {
            let vc = UIStoryboard(name: SBId.main.rawValue.capitalized, bundle: nil).instantiateViewController(identifier: VCId.main.rawValue) as! MainViewController
            vc.animal = array[count]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

