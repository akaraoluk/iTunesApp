//
//  LoginViewController.swift
//  iTunesApp
//
//  Created by Abdurrahman Karaoluk on 7.08.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var logoUIView: UIView!
    
    private let loginVCViewModel = LoginVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logoUIView.backgroundColor = UIColor(patternImage: UIImage(named: "background-vector.png")!)
        
        if UserDefaults.standard.bool(forKey: "isUserLogedIn") == true {
            if let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchViewController.self)) as? SearchViewController {
                self.navigationController?.pushViewController(searchVC, animated: false)
            }
        }
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        if (emailTextField.text == "admin" && passwordTextField.text == "123456") || loginVCViewModel.isValidEmail(email: emailTextField.text!) == true {
            
            UserDefaults.standard.set(true, forKey: "isUserLogedIn")
            
            if let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: SearchViewController.self)) as? SearchViewController {
                self.navigationController?.pushViewController(searchVC, animated: true)
            }
        }
        else {
            alert(message: "Lütfen email adresini ve şifrenizi kontrol ediniz.", title: "Email veya şifre hatalı")
            passwordTextField.text = ""
        }
    }
    
}

