//
//  CheckboxView.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 29.12.2023.
//

import UIKit

class CheckboxView: UIView {
    private let checkboxButton = UIButton(type: .system)
    private let descriptionLabel = UILabel()

    var isChecked: Bool = false {
        didSet {
            updateCheckboxState()
        }
    }

    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        // Checkbox button setup
        checkboxButton.setImage(UIImage(systemName: "circle"), for: .normal)
        checkboxButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        checkboxButton.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)

        // Description label setup
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0

        // Stack view to arrange checkbox and description horizontally
        let stackView = UIStackView(arrangedSubviews: [checkboxButton, descriptionLabel])
        stackView.alignment = .center
        stackView.spacing = 8

        addSubview(stackView)

        // Layout constraints
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        }

        // Initial update of checkbox state
        updateCheckboxState()
    }

    @objc private func checkboxTapped() {
        isChecked.toggle()
    }

    private func updateCheckboxState() {
        checkboxButton.isSelected = isChecked
    }
}

