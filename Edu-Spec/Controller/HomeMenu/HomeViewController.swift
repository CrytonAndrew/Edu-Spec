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
        extendedLayoutIncludesOpaqueBars = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.hidesBackButton = false
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
}
