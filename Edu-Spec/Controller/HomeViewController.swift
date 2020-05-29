//
//  HomeViewController.swift
//  Edu-Spec
//
//  Created by Cryton Sibanda on 2020/05/23.
//  Copyright © 2020 Cryton Sibanda. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "School Name/Logo"
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
           let firebaseAuth = Auth.auth()
       do {
         try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
       } catch let signOutError as NSError {
         print ("Error signing out: %@", signOutError)
       }
         
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
