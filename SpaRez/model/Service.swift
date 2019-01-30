//
//  Service.swift
//  SpaRez
//
//  Created by apple on 7/12/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import Foundation
class Service {
    var serviceName: String
    var servicePrice: String
    var serviceDuration: String
    var serviceLogo: String!
    
    init(serviceName: String, serviceDuration: String, servicePrice: String, serviceLogo: String?) {
        self.serviceName = serviceName
        self.servicePrice = servicePrice
        self.serviceDuration = serviceDuration
        self.serviceLogo = serviceLogo
    }
}
