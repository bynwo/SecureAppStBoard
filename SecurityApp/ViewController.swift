//
//  ViewController.swift
//  SecurityApp
//
//  Created by Emre Çetinkaya on 30.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var loginLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterCorrectPassword), name: .didEnterCorrectPassword, object: nil)
    }
        deinit {
            NotificationCenter.default.removeObserver(self)
        
    
    }
    @objc func didEnterCorrectPassword() {
           showRandomNumber()
       }
    
    func showRandomNumber() {
           
            passwordLabel.text = "Login Succesfull Password: \(3434)"
        }
    
}



