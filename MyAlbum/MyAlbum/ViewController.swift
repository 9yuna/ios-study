//
//  ViewController.swift
//  MyAlbum
//
//  Created by Gyuna on 2020/04/27.
//  Copyright © 2020 gyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func showAlert2(_ sender: Any) {
        let alert2 = UIAlertController(title: "New Alert", message: "new alert message", preferredStyle: .alert)
        let action2 = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert2.addAction(action2)
        present(alert2, animated: true, completion: nil)
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "My First App!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

