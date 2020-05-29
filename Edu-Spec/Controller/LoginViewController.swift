//
//  LoginViewController.swift
//  Edu-Spec
//
//  Created by Cryton Sibanda on 2020/05/23.
//  Copyright © 2020 Cryton Sibanda. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageTextField: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background_3.jpg")!)
        navigationController?.setNavigationBarHidden(false, animated: true)
        setUpPage()
        // Do any additional setup after loading the view.
    }
    
    func setUpPage() {
        //hide error message
        errorMessageTextField.alpha = 0
        
        //Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleHollowButton(loginButton)
    }
    
    @IBAction func loginPressef(_ sender: UIButton) {
        //Validate the text fields
        let error = validateUserInput()
        
        //Check for errors
        if error != nil {
            printErrorMessage(message: error!)
        }
        else {
            //Logging in user]
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().signIn(withEmail: email!, password: password!) { (result, error) in
                //Check for errors
                if error != nil {
                    self.printErrorMessage(message: "Please check if all fields are correct")
                }
                //No errors - Navigate to home screen
                else {
                    self.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
            }
        }
    }
    func loginUser() {
        
    }
    func validateUserInput() ->String? {
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if email! == "" || password! == "" {
            return "Please fill in all the fields"
        }
        return nil
    }
    
    func printErrorMessage(message: String){
        errorMessageTextField.alpha = 1;
        errorMessageTextField.text = "\(message)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
