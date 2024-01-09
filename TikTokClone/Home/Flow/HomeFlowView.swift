//
//  HomeFlowViewController.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 6.01.2024.
//

import UIKit
import SnapKit

enum FlowTab {
    case forYou
    case following
    
    var view: UIView {
        switch self {
        case .following:
            return FollowingEmptyView()
        case .forYou:
            return VideoPlayerView()
        }
    }
    
    var title: String {
        switch self {
        case .following:
            return "Following"
        case .forYou:
            return "For You"
        }
    }
    
    // If you want to change the order of the pages, you can define a computed property
    static var orderedPages: [FlowTab] {
        return [.following, .forYou]
    }
    
    // Function to return an ordered list of UIView objects
    static func orderedViews() -> [UIView] {
        return orderedPages.map { $0.view }
    }
        
        // Function to return an ordered list of titles
    static func orderedTitles() -> [String] {
        return orderedPages.map { $0.title }
    }
}

class HomeFlowView: UIView, UIScrollViewDelegate {

    private lazy var scrollView: UIScrollView = {
           let scrollView = UIScrollView()
           scrollView.delegate = self
           return scrollView
       }()
    private lazy var pageControl: HomePageControl = {
        let pageControl = HomePageControl()
        pageControl.titles = FlowTab.orderedTitles()
        pageControl.didSelectPage = { [weak self] index in
            self?.changePage(index)
        }
        return pageControl
    }()
    private var slides:[UIView] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = FlowTab.orderedViews()
        setupSlideScrollView(slides: slides)

        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 1

        addSubview(scrollView)
        addSubview(pageControl)
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(0)
            make.height.equalTo(40)
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        bringSubviewToFront(pageControl)
    }
    
    private func setupSlideScrollView(slides: [UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        scrollView.contentSize = CGSize(width: frame.width * CGFloat(slides.count), height: frame.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        for i in 0 ..< slides.count {
            scrollView.addSubview(slides[i])
            slides[i].snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(frame.width)
                make.height.equalTo(frame.height)
                make.left.equalTo(frame.width * CGFloat(i))
                if i == slides.count - 1 {
                    make.right.equalToSuperview()
                }
            }
        }
    }


    /*
     * default function called when view is scolled. In order to enable callback
     * when scrollview is scrolled, the below code needs to be called:
     * slideScrollView.delegate = self or
     */
    internal func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let fractionalPage = scrollView.contentOffset.x / pageWidth
        let page = lround(Double(fractionalPage))
        pageControl.currentPage = page
        
        let currentIndex = pageControl.currentPage
        pageControl.animateLinePosition(for: currentIndex)
    }
    
    private func changePage(_ index: Int) {
           let xOffset = scrollView.frame.width * CGFloat(index)
           scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
       }

}
