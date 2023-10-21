//
//  DecryptViewController.swift
//  NeonAcademyNotificationCenter
//
//  Created by Kerem Caan on 31.07.2023.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    let infoLabel = UILabel()
    let decryptedLabel = UILabel()
    var code : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        decryptCode()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "encryptedValue"), object: nil, userInfo: ["password":code])
    }
    func setUpView() {
        code = createPassword(digits: 6)
        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).withAlphaComponent(0.4)
        
        //MARK: - Info Label
        view.addSubview(infoLabel)
        infoLabel.text = "Code decoding"
        infoLabel.textColor = .white
        infoLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
        }
        
        //MARK: - decrypted label
        view.addSubview(decryptedLabel)
        decryptedLabel.isHidden = true
        decryptedLabel.textColor = .white
        decryptedLabel.text = code
        decryptedLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        decryptedLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(infoLabel.snp.bottom).offset(50)
        }
        
    }
    
    func decryptCode(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.infoLabel.text = "Your code is ready."
            self.decryptedLabel.isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.dismiss(animated: true)
                
            }
        }
    }
    
    func createPassword(digits : Int) -> String {
        var number = String()
        for _ in 1...digits {
            number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}
