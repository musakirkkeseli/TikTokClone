//
//  CustomUIPageControl.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 27.12.2023.
//

import UIKit
import SnapKit

class CustomPageControl: UIPageControl {

    var titles: [String] = [] {
        didSet {
            updateLabels()
        }
    }

    private var titleLabels: [UILabel] = []
    
    private var leftTab: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        return label
    }()
    private var rightTab: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isUserInteractionEnabled = true
        return label
    }()
    let rightLine = UIView()
    let leftLine = UIView()

    override var currentPage: Int {
        didSet {
            updateSelectedLabel()
        }
    }

    var didSelectPage: ((Int) -> Void)?

    private func updateLabels() {
        titleLabels.forEach { $0.removeFromSuperview() }
        titleLabels = []

        leftTab.text = titles.first
        rightTab.text = titles.last

        leftTab.textColor = currentPage == 0 ? .red : .yellow
        rightTab.textColor = currentPage == 1 ? .red : .yellow

        let tapGestureLeft = UITapGestureRecognizer(target: self, action: #selector(leftTabTapped))
        leftTab.addGestureRecognizer(tapGestureLeft)
        let tapGestureRight = UITapGestureRecognizer(target: self, action: #selector(rightTabTapped))
        rightTab.addGestureRecognizer(tapGestureRight)

        leftLine.backgroundColor = currentPage == 0 ? .blue : .black
        rightLine.backgroundColor = currentPage == 1 ? .blue : .black

        addSubview(leftTab)
        addSubview(rightTab)
        addSubview(leftLine)
        addSubview(rightLine)

        // Adjust the frame as needed
        leftTab.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalToSuperview()
            make.left.equalToSuperview()
        }

        rightTab.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalToSuperview()
            make.right.equalToSuperview()
        }

        leftLine.snp.makeConstraints { make in
            make.centerX.equalTo(leftTab.snp.centerX)
            make.bottom.equalTo(leftTab.snp.bottom)
            make.width.equalTo(leftTab.snp.width)
            make.height.equalTo(2) // Adjust the line height as needed
        }

        rightLine.snp.makeConstraints { make in
            make.centerX.equalTo(rightTab.snp.centerX)
            make.bottom.equalTo(rightTab.snp.bottom)
            make.width.equalTo(rightTab.snp.width)
            make.height.equalTo(2) // Adjust the line height as needed
        }
    }


    private func updateSelectedLabel() {
        leftTab.textColor = currentPage == 0 ? .black : .gray
            rightTab.textColor = currentPage == 1 ? .black : .gray
            leftLine.backgroundColor = currentPage == 0 ? .black : .gray
            rightLine.backgroundColor = currentPage == 1 ? .black : .gray
        }

    @objc private func leftTabTapped() {
        didSelectPage?(0)
    }

    @objc private func rightTabTapped() {
        didSelectPage?(1)
    }
}
