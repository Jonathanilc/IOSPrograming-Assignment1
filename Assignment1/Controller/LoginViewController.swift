//
//  LoginViewController.swift
//  Assignment1
//
//  Created by Jonathan on 6/05/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameField.delegate = self
        passwordField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: userNameField.text!, password: passwordField.text!) { (user, error) in
            if error != nil {
                print(error)
            }else {
                print("Signed In Succesfuly!")
                self.performSegue(withIdentifier: "toMainView", sender: self)
            }
        }
        
    }
    
    //textField Begin Editting
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.heightConstraint.constant = 60
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 251
            self.view.layoutIfNeeded()
        }
    }
    
    // view being tapped
    @objc func viewTapped() {
        userNameField.endEditing(true)
        passwordField.endEditing(true)
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
