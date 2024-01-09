//
//  PhoneViewController.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 26.12.2023.
//

import UIKit
import SnapKit

class PhoneUIView: UIView {

    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Phone Number"
        return textField
    }()

    let sendCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Send Code", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    let checkboxView: CheckboxView = {
        let checkbox = CheckboxView()
        checkbox.descriptionText = "I confirm something"
        return checkbox
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        return label
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
        addSubview(phoneNumberTextField)
        addSubview(checkboxView)
        addSubview(infoLabel)
        addSubview(sendCodeButton)

        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        checkboxView.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(checkboxView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        sendCodeButton.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }
    }
}

