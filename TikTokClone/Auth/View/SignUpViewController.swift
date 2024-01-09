//
//  SingUpViewController.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 29.12.2023.
//

import UIKit
import SnapKit

class SingUpViewController: UIViewController {

    let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Sign Up to TikTok"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textColor = .black
            return label
        }()
        let subtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Create an account to get started"
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .gray
            return label
        }()
    let emailButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        emailButton.setTitle("Use phone or email", for: .normal)
        emailButton.tintColor = .red
        emailButton.setTitleColor(.black, for: .normal)
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(emailButton)
        
        titleLabel.snp.makeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
                    make.centerX.equalToSuperview()
                }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        emailButton.snp.makeConstraints{make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(8)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(0.7)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview().offset(-10) // Adjust the
        }
    }
    
    @objc func emailButtonTapped() {
        let phoneVC = EmailOrPhoneViewController()
            let navController = UINavigationController(rootViewController: phoneVC)
            navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }

}
