//
//  ColorController.swift
//  Journal+Firebase
//
//  Created by Ivan Ramirez on 2/17/22.
//

import UIKit

enum ColorController {

    case offWhite
    case softGreen
    case goldenYellow
    case richGold
    case lightGreen
    case hardBlue
    case darkBlue
}

extension ColorController {

    var value: UIColor {
        get {
            switch self {
            case .offWhite:
                return UIColor(red: 229/255, green: 246/255, blue: 255/255, alpha: 1.0)
            case .softGreen:
                return UIColor(red: 95/255, green: 148/255, blue: 93/255, alpha: 1.0)
            case .goldenYellow:
                return UIColor(red: 244/255, green: 218/255, blue: 83/255, alpha: 1.0)
            case .richGold:
                return UIColor(red: 252/255, green: 198/255, blue: 45/255, alpha: 1.0)
            case .lightGreen:
                return UIColor(red: 28/255, green: 168/255, blue: 146/255, alpha: 1.0)
            case .hardBlue:
                return UIColor(red: 30/255, green: 55/255, blue: 65/255, alpha: 1.0)
            case .darkBlue:
                return UIColor(red: 12/255, green: 72/255, blue: 128/255, alpha: 1.0)
            }
        }
    }
}
