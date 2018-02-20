//
//  ViewController.swift
//  HandlingLoginErrorsWithEnumHelperFunctions
//
//  Created by Apple on 20/02/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import UIKit

enum LoginError: Error {
    case incompleteForm
    case invalidEmail
    case incorrectPasswordLength
}

class ViewController: UIViewController {
    
    
    // Outlets:
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
        
    }

    @IBAction func LoginBtnPressed(_ sender: UIButton) {
        do {
            
            try handleLogin()
        }catch LoginError.incompleteForm {
            
            showAlert(title: "InCompleteForm", message: "Please enter both the text fields", vc: self)
            
        }catch LoginError.invalidEmail {
            
            showAlert(title: "In valid email", message: "Please check your email, you have entered an invalid email", vc: self)
            
        }catch LoginError.incorrectPasswordLength {
            showAlert(title: "PassWord too short", message: "Please enter a password greater than 6 characters", vc: self)
        }catch {
            showAlert(title: "Unable To Login", message: "There was an error when attempting to login", vc: self)
        }
    }
    
    func handleLogin() throws {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.count < 6 {
            throw LoginError.incorrectPasswordLength
        } else {
            print(" No errors!, Validation successfull")
        }
        
        
        
        
    }


}

