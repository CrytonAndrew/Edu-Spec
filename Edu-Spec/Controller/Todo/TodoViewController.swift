//
//  TodoViewController.swift
//  Edu-Spec
//
//  Created by Cryton Sibanda on 2020/06/16.
//  Copyright © 2020 Cryton Sibanda. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationItem.hidesBackButton = false
    }

}
