//
//  ServiceCell.swift
//  SpaRez
//
//  Created by apple on 7/11/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import UIKit

class ServiceCell: UITableViewCell {

  
    @IBOutlet weak var serviceName: UILabel!
    
    @IBOutlet weak var serviceLogo: UIImageView!
    
    @IBOutlet weak var serviceDuration: UILabel!
    
    @IBOutlet weak var servicePrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
