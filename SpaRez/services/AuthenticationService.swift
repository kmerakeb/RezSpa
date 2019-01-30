//
//  AuthenticationService.swift
//  SpaRez
//
//  Created by apple on 7/8/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import Foundation
import Firebase

class AuthenticationService {
    static let instance = AuthenticationService()
    
    func registerUser(withEmail email: String, withPassword password: String, userRegistrationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userRegistrationComplete(false, error)
                return
            }
            let userData = ["provider": user.user.providerID, "email": user.user.email]
            RefService.instance.createDBUser(uid: user.user.uid, userData: userData)
            userRegistrationComplete(true, nil)
            // ...
        }
        // ...
    }
    
    func loginUser(withEmail email: String, withPassword password: String, userLoginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error != nil {
                    userLoginComplete(false, error)
                    return
            // ...
        }
                userLoginComplete(true, nil)
        }
    }
}

