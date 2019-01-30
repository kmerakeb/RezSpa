//
//  LoginViewController.swift
//  SpaRez
//
//  Created by apple on 7/7/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signinButtonPressed(_ sender: Any) {
        if emailTextField.text != nil && passwordTextField.text != nil {
            AuthenticationService.instance.loginUser(withEmail: emailTextField.text!, withPassword: passwordTextField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("error: \(String(describing: loginError?.localizedDescription))")
                }
                AuthenticationService.instance.registerUser(withEmail: self.emailTextField.text!, withPassword: self.passwordTextField.text!, userRegistrationComplete: { (success, registrationError) in
                    if success {
                        AuthenticationService.instance.loginUser(withEmail: self.emailTextField.text!, withPassword: self.passwordTextField.text!, userLoginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                                print("successfully registred the user")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            }
            
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: UITextFieldDelegate {}
