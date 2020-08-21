//
//  HeaderView.swift
//  Axxess
//
//  Created by iOS TNK on 21/08/20.
//  Copyright © 2020 iOS TNK. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func sortbyType(_ sender : UIButton)
}

class HeaderView: UIView {
    var delegate : HeaderViewDelegate?
    
    @IBAction func typeAction(_ sender : UIButton) -> Void {
        delegate?.sortbyType(sender)
    }
}
