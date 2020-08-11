//
//  Extensions.swift
//  a
//
//  Created by Анна on 11.08.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit

extension UIButton {
    func makePulse() {
        let pulse1 = CASpringAnimation(keyPath: "transform.scale")
        pulse1.duration = 1.0
        pulse1.fromValue = 1.0
        pulse1.toValue = 1.12
        pulse1.repeatCount = 1

        self.layer.add(pulse1, forKey: nil)
    }
}
struct Animal {
       let name: String
       let image: UIImage
   }
enum VCId: String {
       case main
   }
   enum SBId: String {
       case main
   }
