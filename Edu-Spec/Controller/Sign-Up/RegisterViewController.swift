//
//  RegisterViewController.swift
//  Edu-Spec
//
//  Created by Cryton Sibanda on 2020/05/23.
//  Copyright © 2020 Cryton Sibanda. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageTextField: UILabel!
    @IBOutlet weak var registerButton: UIButton!
    
    enum Tabs : Int {
        case Dashboard
        case Middle
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        setUpPage()
    }
    func setUpPage() {
        //Hide error messsge:
        errorMessageTextField.alpha = 0
        
        //Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(registerButton)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        //Validate information from user
        let error = validateFields()
        
        if error != nil {//Print error
            printErrorMessage(error!)
        }
        else{
        //Create user
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    //Error occurs creating user
                    self.printErrorMessage("User already exists")
                }
                else{
                   //User created successfully
                   //Put user in database
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["first_name": firstName, "last_name": lastName, "uid": result!.user.uid]) { (error) in
                        if error != nil{
                            self.printErrorMessage("Failed adding to database")
                        }
                    }
                    //Navigate to home screen
                    self.navigateToHomeScreen()
                }
            }
        }
    }
    
    func navigateToHomeScreen() {
//        performSegue(withIdentifier: "RegisterToHome", sender: self)
        
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        mainTabController.selectedViewController = mainTabController.viewControllers?[0]
        mainTabController.modalPresentationStyle = .fullScreen
        present(mainTabController, animated: true, completion: nil)
        
    }
    
    func printErrorMessage(_ error: String){
        errorMessageTextField.alpha = 1
        errorMessageTextField.text = error
    }
    
    func validateFields() -> String? {
        //Check all feilds filled
        let name = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let surname = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if name == "" || surname == "" || email == "" || password == "" {
            return "Please fill in all fields"
        }
        
        //Check if password is valid
        if Utilities.isPasswordValid(password!) == false{
            return "Please make sure password is atleast 8 characters and comtains any special characters and numerics"
        }
        
        return nil
    }

}
