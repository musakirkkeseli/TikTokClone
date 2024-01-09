//
//  EmailViewController.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 26.12.2023.
//

import UIKit
import SnapKit

class EmailUIView: UIView {
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email or User Name"
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Password"
        return textField
    }()
    let checkboxView: CheckboxView = {
        let checkbox = CheckboxView()
        checkbox.descriptionText = "I confirm something"
        return checkbox
    }()
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot pasword?", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    let singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    private func setupUI() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(checkboxView)
        addSubview(forgotPasswordButton)
        addSubview(singInButton)

        emailTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        checkboxView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(checkboxView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        singInButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }
    }
}
