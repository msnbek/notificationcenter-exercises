//
//  ViewController.swift
//  NotificationCenterr
//
//  Created by Mahmut Senbek on 27.09.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let timerLabel = UILabel()
    let passwordLabel = UILabel()
    let decrpytButton = UIButton()
    let passwordTextField = UITextField()
    let leaveapp = UILabel()
    var timer = Timer()
    var count = 15
    var encrpytedData = ""
    
    override func viewDidLoad() {
        style()
        NotificationCenter.default.addObserver(self, selector: #selector(dataEncrypted), name: NSNotification.Name(rawValue: "encryptedValue"), object: nil)
    }
    
    @objc func decrpytButtonClicked() {
        decrpytButton.setTitle("Decrpyting...", for: .normal)
        decrpytButton.isEnabled = false
        passwordTextField.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerLogic), userInfo: nil, repeats: true)
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: false)
    }
    
    @objc func timerLogic() {
        if count > 0 {
            count -= 1
            self.timerLabel.text = "\(count)"
        } else if count == 0 {
            timer.invalidate()
            passwordTextField.isEnabled = false
            if passwordTextField.text == encrpytedData {
                makeAlert(titleInput: "Well done!", messageInput: "Data encrypted. True password.")
            }else if passwordTextField.text != encrpytedData{
                let alert = UIAlertController(title: "Error", message: "Password incorrect", preferredStyle: UIAlertController.Style.alert)
                let action = UIAlertAction(title: "OK!", style: UIAlertAction.Style.default) {  (action : UIAlertAction) in
                    self.justLeaveTheApp()
                }
                alert.addAction(action)
                self.present(alert, animated: true)
                
            }else if passwordTextField.text == "" {
                makeAlert(titleInput: "Where is your code?", messageInput: "You forget to enter code.")
            }
        }
    }
    @objc func dataEncrypted(data : Notification) {
        if let userData = data.userInfo {
            encrpytedData = userData["password"] as! String
            self.passwordLabel.text = String(encrpytedData)
            DispatchQueue.main.asyncAfter(deadline: .now() + 10)    {
                self.passwordLabel.text = ""
            }
        }
    }
    
    func justLeaveTheApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.leaveapp.isHidden = false
        }
    }
    
    func makeAlert(titleInput : String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK!", style: UIAlertAction.Style.default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    
}
