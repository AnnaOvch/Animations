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
extension UILabel {
    func expandLabel() {
        UIView.animate(withDuration: 0.6, animations: { self.transform = CGAffineTransform(scaleX: 2, y: 2)},
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.transform = CGAffineTransform.identity
                        }
        })
    }
}

extension UIView {
    func shake () {
        let animation = CABasicAnimation(keyPath: "position")
           animation.duration = 0.0
           animation.repeatCount = 2
           animation.autoreverses = true
           animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 20, y: self.center.y))
           animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 20, y: self.center.y))

           self.layer.add(animation, forKey: nil)
    }
}

extension UIImageView {
    enum Direction {
        case right
        case left
    }
    func flipImageView(direction: Direction) {
        switch direction {
        case .right:
            UIView.transition(with: self, duration: 0.6, options: .transitionFlipFromRight, animations: nil, completion: nil)
        case .left:
            UIView.transition(with: self, duration: 0.6, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
        
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
enum Constants: Int {
    case startShift = 50
}
