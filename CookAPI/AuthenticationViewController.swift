//
//  AuthenticationViewController.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 13/01/2023.
//

import UIKit
import FirebaseAuth

class AuthenticationViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!

    @IBOutlet weak var mailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Connexion"
        self.mailErrorLabel.text = nil
        self.passwordErrorLabel.text = nil
    }
    
    @IBAction func handleLogin(_ sender: UIButton) {
        Authentication.signIn(email: self.mailTextField.text ?? "", password: self.passwordTextField.text ?? "")
        /*
        self.mailErrorLabel.text = "E-mail ou mot de passe invalide"
        self.passwordErrorLabel.text = "E-mail ou mot de passe invalide"
         */
    }
    
     override func viewWillAppear(_ animated: Bool) {
         handle = Auth.auth().addStateDidChangeListener { auth, user in
             if user != nil {
                 self.navigationController?.setViewControllers([SuccessAuthViewController()], animated: true)
             }
         }
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         Auth.auth().removeStateDidChangeListener(handle!)
     }
     
}
