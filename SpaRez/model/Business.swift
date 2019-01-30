//
//  Business.swift
//  SpaRez
//
//  Created by apple on 7/9/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import Foundation

class Business {
     var businessName: String
     var businessCategory: String
     var businessStreet: String
     var businessState: String
     var businessCity: String
     var businessPhone: String
    var businessLogo: String!
    
    init(businessName: String, businessCategory: String, businessStreet: String, businessState: String, businessCity: String, businessPhone: String, businessLogo: String?){
        self.businessName = businessName
        self.businessPhone = businessPhone
        self.businessCategory = businessCategory
        self.businessCity = businessCity
        self.businessState = businessState
        self.businessStreet = businessStreet
        self.businessLogo = businessLogo
    }
}
