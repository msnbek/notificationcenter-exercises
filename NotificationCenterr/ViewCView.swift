//
//  ViewCView.swift
//  NotificationCenterr
//
//  Created by Mahmut Senbek on 27.09.2023.
//

import UIKit

import UIKit

extension ViewController {
    func style() {
        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1).withAlphaComponent(0.4)
        view.addSubview(timerLabel)
        view.addSubview(decrpytButton)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(leaveapp)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        decrpytButton.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        leaveapp.translatesAutoresizingMaskIntoConstraints = false
        
        leaveapp.isHidden = true
        
        //MARK: - TimerLabel
        
        timerLabel.text = "\(count)"
        timerLabel.font = .systemFont(ofSize: 36, weight: .bold)
        timerLabel.textColor = .white
        timerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalToSuperview().offset(70)
        }
        
        //MARK: - PasswordLabel
        
        passwordLabel.text = ""
        passwordLabel.textColor = .white
        passwordLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        
        passwordLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(timerLabel.snp.bottom).offset(20)
        }
        
        //MARK: - Password TextField
        
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Enter Code!",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.font = .boldSystemFont(ofSize: 30)
        passwordTextField.borderStyle = .bezel
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 3
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textColor = .white
        passwordTextField.textAlignment = .center
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(40)
            make.centerX.equalTo(view)
            
        }
        
        //MARK: - Decrpyt Button
        
        decrpytButton.setTitle("Decrpyt", for: .normal)
        decrpytButton.setTitleColor(.black, for: .normal)
        decrpytButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        decrpytButton.backgroundColor = .white
        decrpytButton.addTarget(self, action: #selector(decrpytButtonClicked), for: .touchUpInside)
        decrpytButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(60)
            make.centerX.equalTo(view)
            
        }
        
        //MARK: - Leave App Label
        leaveapp.text = "Just leave the app you are looser."
        leaveapp.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        leaveapp.textAlignment = .center
        leaveapp.textColor = .white
        
        leaveapp.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        
        
    }
}
