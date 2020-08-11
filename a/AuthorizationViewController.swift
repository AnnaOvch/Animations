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
    
    @IBOutlet weak var myTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var myButtonConstraint: NSLayoutConstraint!
    
    
    let array = [
        Animal(name: "Raccoon", image: UIImage(named: "profile0")!),
        Animal(name: "Dog", image: UIImage(named: "profile1")!),
        Animal(name: "Hamster", image: UIImage(named: "profile2")!),
        Animal(name: "Cat", image: UIImage(named: "profile3")!)
    ]
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextFieldConstraint.constant -= CGFloat(Constants.startShift.rawValue)
        myButtonConstraint.constant -= (self.view.frame.width - myButton.frame.width)/2
        myImageView.image = array[count].image
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = myImageView.frame.height/2
        myLabel.text = array[count].name
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.0) {
            self.myTextFieldConstraint.constant += CGFloat(Constants.startShift.rawValue)
            self.myButtonConstraint.constant += (self.view.frame.width - self.myButton.frame.width)/2
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        commonActionForNextBack(sender)
        if count == 0 {
            myTextField.shake()
        }
        if count>0 {
            count = count-1
            myImageView.image = array[count].image
            myLabel.text = array[count].name
            
            myImageView.flipImageView(direction: .left)
            myLabel.expandLabel()
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        commonActionForNextBack(sender)
        if count == 3 {
            myTextField.shake()
        }
        if count<3 {
            count = count+1
            myImageView.image = array[count].image
            myLabel.text = array[count].name
            
            myImageView.flipImageView(direction: .right)
            myLabel.expandLabel()
        }
    }
    
    @IBAction func logInButton(_ sender: Any) {
        if array[count].name == myTextField.text {
            let vc = UIStoryboard(name: SBId.main.rawValue.capitalized, bundle: nil).instantiateViewController(identifier: VCId.main.rawValue) as! MainViewController
            vc.animal = array[count]
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            myTextField.backgroundColor = .red
            myTextField.shake()
        }
    }

    func commonActionForNextBack(_ sender: UIButton) {
         sender.makePulse()
        myTextField.backgroundColor = .white
        myTextField.text = ""
    }
}


