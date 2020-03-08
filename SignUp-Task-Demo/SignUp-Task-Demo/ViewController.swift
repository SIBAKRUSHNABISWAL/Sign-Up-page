//
//  ViewController.swift
//  SignUp-Task-Demo
//
//  Created by Siba on 06/03/20.
//  Copyright © 2020 Mobiotics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signUpButton.layer.cornerRadius = 5
        signUpButton.layer.masksToBounds = true
    }


}

