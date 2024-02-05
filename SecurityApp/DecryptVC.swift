//
//  DecryptVC.swift
//  SecurityApp
//
//  Created by Emre Çetinkaya on 30.01.2024.
//

import UIKit

extension Notification.Name {
    static let didEnterCorrectPassword = Notification.Name("DidEnterCorrectPassword")
}

class DecryptVC: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    
    
       var timer = Timer()
       var counter = 0
       var hideTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 15
                timeLabel.text = String(counter)
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
                
                hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideLogin), userInfo: nil, repeats: true)
        
        
        
    }
    
    @objc func hideLogin(){
        if counter == 0 {
            passwordTF.isEnabled = false
            passwordTF.text = ""
        }
    }
    @objc func countDown(){
          counter -= 1
          timeLabel.text = String(counter)
          
          if counter == 0 {
              timer.invalidate()
          }
      }
    
    @IBAction func loginButton(_ sender: Any) {
        
        if let  enteredpassword = passwordTF.text , enteredpassword == "3434" {
                   NotificationCenter.default.post(name: .didEnterCorrectPassword, object: nil)
                   navigationController?.popViewController(animated: true)
               } else {
                   let alert = UIAlertController(title: "Error", message: "Please try again.", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                   alert.addAction(okAction)
                   present(alert, animated: true, completion: nil)
               }
    }
}
    


