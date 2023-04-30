//
//  Extensions.swift
//  StockApp
//
//  Created by Димаш Алтынбек on 30.04.2023.
//

import Foundation
import UIKit

//MARK: -Fraiming
extension UIView {
    var width: CGFloat {
        frame.size.width
    }
    
    var height: CGFloat {
        frame.size.height
    }
    
    var left: CGFloat {
        frame.origin.x
    }
    
    var right: CGFloat {
        left + width
    }
    
    var top: CGFloat {
        frame.origin.y
    }
    
    var bottom: CGFloat {
        top + height
    }
}
