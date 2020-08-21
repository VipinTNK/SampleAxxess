//
//  UIView.swift
//  Dummy
//
//  Created by Dummy on 14/6/19.
//  Copyright © 2019 Dummy. All rights reserved.
//

import Foundation
import UIKit

enum AIEdge:Int {
    case
    Top,
    Left,
    Bottom,
    Right,
    Top_Left,
    Top_Right,
    Bottom_Left,
    Bottom_Right,
    All,
    None
}

extension UIView {
    
    /// set shadow along all sides of view
    func setShadowOverView(widthOffset: CGFloat, heightOffset: CGFloat, color: UIColor, opacityValue: Float, shadowRadiusValue : CGFloat) {
        self.clipsToBounds = false
        let shadowLayer = self.layer
        shadowLayer.shadowOffset = CGSize(width: widthOffset, height: heightOffset)
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOpacity = opacityValue
        shadowLayer.shadowRadius = shadowRadiusValue
    }
    
    func addPropertiesToView(borderColor : UIColor, borderWidth : CGFloat, bgColor : UIColor, cornerRadius : CGFloat, maskBound : Bool)  {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = maskBound
        self.backgroundColor = bgColor

    }

    func addViewTopAndBottomCorner(topCorner: Bool) {
        
        if topCorner {
            if #available(iOS 11.0, *){
                self.clipsToBounds = false
                self.layer.cornerRadius = 10
                self.layer.borderColor = UIColor.lightGray.cgColor
                self.layer.borderWidth = 0.3
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }else{
                let rectShape = CAShapeLayer()
                rectShape.bounds = self.frame
                rectShape.position = self.center
                rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
                self.layer.mask = rectShape
            }
        }else{
            
            if #available(iOS 11.0, *){
                self.clipsToBounds = false
                self.layer.cornerRadius = 10
                self.layer.borderColor = UIColor.lightGray.cgColor
                self.layer.borderWidth = 0.3
                self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,]
            }else{
                let rectShape = CAShapeLayer()
                rectShape.bounds = self.frame
                rectShape.position = self.center
                rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
                self.layer.mask = rectShape
            }
        }
    }
   
    // set cornerRadius Of view
    func setCornerRadiusOfView(cornerRadiusValue : CGFloat) {
        self.layer.cornerRadius = cornerRadiusValue
        self.clipsToBounds = true
    }
    
    func setCornerRadiusOfViewWithBorderWithColor(cornerRadiusValue : CGFloat, borderColor : UIColor, width : CGFloat) {
        self.layer.cornerRadius = cornerRadiusValue
        self.clipsToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = borderColor.cgColor.copy(alpha: 0.5)
    }
    
    func setShadowOnAllSidesOfView(shadowSizeValue: CGFloat) {
        let shadowSize : CGFloat = shadowSizeValue
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.frame.size.width + shadowSize,
                                                   height: self.frame.size.height + shadowSize))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func applyShadowWithCornerRadius(color:UIColor, opacity:Float, radius: CGFloat, edge:AIEdge, shadowSpace:CGFloat, cornerRadius : CGFloat)    {

        var sizeOffset:CGSize = CGSize.zero
        switch edge {
        case .Top:
            sizeOffset = CGSize(width: 0, height: -shadowSpace)
        case .Left:
            sizeOffset = CGSize(width: -shadowSpace, height: 0)
        case .Bottom:
            sizeOffset = CGSize(width: 0, height: shadowSpace)
        case .Right:
            sizeOffset = CGSize(width: shadowSpace, height: 0)


        case .Top_Left:
            sizeOffset = CGSize(width: -shadowSpace, height: -shadowSpace)
        case .Top_Right:
            sizeOffset = CGSize(width: shadowSpace, height: -shadowSpace)
        case .Bottom_Left:
            sizeOffset = CGSize(width: -shadowSpace, height: shadowSpace)
        case .Bottom_Right:
            sizeOffset = CGSize(width: shadowSpace, height: shadowSpace)


        case .All:
            sizeOffset = CGSize(width: 0, height: 0)
        case .None:
            sizeOffset = CGSize.zero
        }
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = sizeOffset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false

        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
    }
}
//Class ends here
