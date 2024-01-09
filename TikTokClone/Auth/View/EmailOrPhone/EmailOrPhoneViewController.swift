//
//  EmailOrPhoneViewController.swift
//  TikTokClone
//
//  Created by Musa KIRKKESELİ on 26.12.2023.
//

import UIKit
import SnapKit

enum OnboardingPage {
    case phone
    case email
    
    var view: UIView {
        switch self {
        case .phone:
            return PhoneUIView()
        case .email:
            return EmailUIView()
        }
    }
    
    var title: String {
        switch self {
        case .phone:
            return "Phone"
        case .email:
            return "Email"
        }
    }
    
    // If you want to change the order of the pages, you can define a computed property
    static var orderedPages: [OnboardingPage] {
        return [.phone, .email]
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


class EmailOrPhoneViewController: UIViewController, UIScrollViewDelegate {

    lazy var scrollView: UIScrollView = {
           let scrollView = UIScrollView()
           scrollView.delegate = self
           return scrollView
       }()

    lazy var pageControl: CustomPageControl = {
        let pageControl = CustomPageControl()
        pageControl.titles = OnboardingPage.orderedTitles()
        pageControl.didSelectPage = { [weak self] index in
            self?.changePage(index)
        }
        return pageControl
    }()

    var slides:[UIView] = [];
    
    override func viewDidLoad() {
        title = "Sign In"
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // Set up the left bar button item
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .plain,
            target: self,
            action: #selector(dismissView)
        )
        
        slides = OnboardingPage.orderedViews()
        setupSlideScrollView(slides: slides)

        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0

        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(40)
            make.width.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(pageControl.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        view.bringSubviewToFront(pageControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupSlideScrollView(slides: [UIView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        for i in 0 ..< slides.count {
            scrollView.addSubview(slides[i])
            slides[i].snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(view.frame.width)
                make.left.equalTo(view.frame.width * CGFloat(i))
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
    }
    
    private func changePage(_ index: Int) {
           let xOffset = scrollView.frame.width * CGFloat(index)
           scrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
       }
    
    // Function to handle the back button action
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}
