//
//  FollowingEmptyView.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 4.01.2024.
//

import UIKit

class FollowingEmptyView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .black
    }

}
