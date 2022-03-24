//
//  Extensions.swift
//  Journal+Firebase
//
//  Created by Ivan Ramirez on 2/16/22.
//

import UIKit

extension UIView {


    func verticalGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            ColorController.offWhite.value.cgColor,
            #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.8)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.2)

        self.layer.insertSublayer(gradient, at: 0)
    }

    func shake() {

        let translateRight = CGAffineTransform(translationX: 4.0, y: 0)
        let translateLeft = CGAffineTransform(translationX: -4.0, y: 0)

        self.transform = translateRight
        UIView.animate(withDuration: 0.07, delay: 0.01, options: [.autoreverse, .repeat], animations: {
            UIView.setAnimationRepeatCount(2.5)
            self.transform = translateLeft
        }) { finished in
            if finished {
                self.transform = CGAffineTransform.identity
            }
        }
    }
}
