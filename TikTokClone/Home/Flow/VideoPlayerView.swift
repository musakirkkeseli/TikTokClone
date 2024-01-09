//
//  HomeFlowView.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 31.12.2023.
//

import UIKit
import SnapKit
import AVKit

class VideoPlayerView: UIView {

    var playerViewController: AVPlayerViewController!
    var player: AVPlayer!
    private var likeButton: UIButton = {
        let button = UIButton()
        button.setTitle("3,450", for: .normal)
        button.setTitleColor(.white, for: .normal)
        let image = UIImage(named: "music_white")
        image?.withTintColor(.white)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .red
        setupUI()
    }

    private func setupUI() {
        // Initialize AVPlayerViewController
        playerViewController = AVPlayerViewController()
        playerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(playerViewController.view)
        addSubview(likeButton)

        // Set up AVPlayer with a sample video URL (replace this with your video URL)
        if let videoURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/tiktokclone-b9045.appspot.com/o/Download.mp4?alt=media&token=1e7a45eb-b807-4d10-991e-fae6b80eb6a8") {
            player = AVPlayer(url: videoURL)
            playerViewController.player = player
        }

        // Start playing the video
        // player.play()

        // Add tap gesture recognizer to the player view
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        playerViewController.view.addGestureRecognizer(tapGesture)

        // Set up constraints for playerViewController
        NSLayoutConstraint.activate([
            playerViewController.view.topAnchor.constraint(equalTo: topAnchor),
            playerViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            playerViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            playerViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        likeButton.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-20)
        }

        // Bring the player's view to the front
        bringSubviewToFront(playerViewController.view)
    }

    // You might want to override layoutSubviews to handle resizing and repositioning of subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        playerViewController.view.frame = bounds
    }

    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        // Handle tap gesture to play/pause the video
        if player.rate == 0 {
            // If the video is paused, play it
            player.play()
        } else {
            // If the video is playing, pause it
            player.pause()
        }
    }
}

