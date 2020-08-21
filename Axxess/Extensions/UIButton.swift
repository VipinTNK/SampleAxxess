//
//  UIButton.swift
//  ECGame
//
//  Created by hfcb on 1/20/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import Foundation
import CoreFoundation
import UIKit

extension UIButton {
    
    // set cornerRadius Of button
    func setCornerRadiusOfButton(cornerRadiusValue : CGFloat, borderColor: CGColor, borderWidth: CGFloat) {
        self.layer.cornerRadius = cornerRadiusValue
        self.clipsToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
    func setCornerRadiusOfButtonWithBorderWithColor(cornerRadiusValue : CGFloat, borderColor : UIColor, width : CGFloat) {
        self.layer.cornerRadius = cornerRadiusValue
        self.clipsToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor.cgColor
    }
    
    func setmultipleLineTitle(titleString : String) {
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.setTitle(titleString, for: .normal)
        self.setTitle(titleString, for: .selected)
        self.titleLabel?.textAlignment = .center
        self.sizeToFit()
    }
    
}
