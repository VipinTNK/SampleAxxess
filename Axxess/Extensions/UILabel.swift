//
//  UILabel.swift
//  ECGame
//
//  Created by hfcb on 07/01/20.
//  Copyright © 2020 tnk. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func addPropertiesToLabel(borderColor : UIColor, borderWidth : CGFloat, bgColor : UIColor, cornerRadius : CGFloat, maskBound : Bool)  {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskBound
        self.backgroundColor = bgColor
    
    }
    
    func animation(typing value:String,duration: Double){
      let characters = value.map { $0 }
      var index = 0
      Timer.scheduledTimer(withTimeInterval: duration, repeats: true, block: { [weak self] timer in
          if index < value.count {
              let char = characters[index]
              self?.text! += "\(char)"
              index += 1
          } else {
              timer.invalidate()
          }
      })
    }

    func setCornerRadiusOfLabelWithBorderWithColor(cornerRadiusValue : CGFloat, borderColor : UIColor, width : CGFloat) {
        self.layer.cornerRadius = cornerRadiusValue
        self.clipsToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor.cgColor
    }

    func textWithAnimation(text:String,duration:CFTimeInterval){
      fadeTransition(duration)
      self.text = text
    }

    //followed from @Chris and @winnie-ru
    func fadeTransition(_ duration:CFTimeInterval) {
      let animation = CATransition()
      animation.timingFunction = CAMediaTimingFunction(name:
          CAMediaTimingFunctionName.easeInEaseOut)
      animation.type = CATransitionType.fade
      animation.duration = duration
      layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    //set border with color of Label
    func SetLabelCorner() {
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.3
    }
    
    func setAttributedTextWithStrings(fisrtStr : String, firstStrSize : CGFloat, firstStrColor : UIColor, secStr : String, secStrSize : CGFloat, secStrColor : UIColor)   {
        let attributedString = NSMutableAttributedString()
    
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: firstStrColor,
            .font: UIFont.init(name: "Roboto-Medium", size: firstStrSize)!
        ]
        var fisrtAttributedStr = NSAttributedString()
        fisrtAttributedStr = NSAttributedString(string: fisrtStr, attributes: attributes)

        let attribute: [NSAttributedString.Key: Any] = [
            .foregroundColor: secStrColor,
            .font: UIFont.init(name: "Roboto-Bold", size: secStrSize)!
        ]
        var secAttributedStr = NSAttributedString()
        secAttributedStr = NSAttributedString(string: secStr, attributes: attribute)
        
        attributedString.append(fisrtAttributedStr)
        attributedString.append(secAttributedStr)
        self.attributedText =  attributedString
    }
}
