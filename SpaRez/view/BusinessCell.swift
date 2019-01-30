//
//  BusinessCell.swift
//  SpaRez
//
//  Created by apple on 7/9/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var businessLogo: UIImageView!
    @IBOutlet weak var businessName: UILabel!
    @IBOutlet weak var businessLocation: UILabel!
    @IBOutlet weak var favBusiness: UIButton!
    @IBOutlet weak var businessPhone: UILabel!
    @IBOutlet weak var businessStreet: UILabel!
    
    //func configureCell(businessLogo: UIImage, businessName: String, businessLocation: String, favBusiness: String) {
   //     self.businessLogo.image = businessLogo
   ////     self.businessName.text = businessName
    //    self.businessLocation.text = businessLocation
   
  //  }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        businessLogo.layer.cornerRadius = 10
        businessLogo.clipsToBounds = true
        businessLogo.layer.borderWidth = 3
        businessLogo.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
