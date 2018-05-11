//
//  RegisterViewController.swift
//  Assignment1
//
//  Created by Jonathan on 6/05/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var heightConstrint: NSLayoutConstraint!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        userNameField.delegate = self
        passwordField.delegate = self
        
        let tapGestrue = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGestrue)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: userNameField.text!, password: passwordField.text!) { (user, error) in
            if error != nil {
                print(error)
            } else {
                print("register successfully!")
                self.performSegue(withIdentifier: "toMainView", sender: self)
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.3) {
            self.heightConstrint.constant = 60
            self.view.layoutIfNeeded()
        }
        print("iamhere")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstrint.constant = 251
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func viewTapped() {
        userNameField.endEditing(true)
        passwordField.endEditing(true)
        print("getting called")
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
