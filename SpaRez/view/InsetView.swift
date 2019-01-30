//
//  InsetView.swift
//  SpaRez
//
//  Created by apple on 7/7/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import UIKit

class InsetView: UIView {

    override func awakeFromNib() {
        setUpView()
        super.awakeFromNib()
    }
    
    func setUpView(){
        self.layer.shadowOpacity = 0.80
        self.layer.shadowRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
