//
//  NotificationsNavigationController.swift
//  IGNotificationsNavBar
//
//  Created by Adrian Navarro on 3/22/19.
//  Copyright © 2019 Adrian Navarro. All rights reserved.
//

import UIKit

class NotificationsNavigationController: UINavigationController {
    
    
    let unselectedColor = UIColor(red: 0.557, green: 0.557, blue: 0.557, alpha: 1.00)
    let selectedColor = UIColor.black

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    
   private func setupNavigationBar() {
        navigationBar.addSubview(followingButton)
        navigationBar.addSubview(youButton)
        navigationBar.addSubview(swipingLineView)
    
        followingButton.topAnchor.constraint(equalTo: navigationBar.topAnchor).isActive = true
        followingButton.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor).isActive = true
        followingButton.trailingAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
        followingButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true

        youButton.topAnchor.constraint(equalTo: navigationBar.topAnchor).isActive = true
        youButton.leadingAnchor.constraint(equalTo: navigationBar.centerXAnchor).isActive = true
        youButton.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor).isActive = true
        youButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
    
        
    
        swipingLineView.frame.origin.x = 0
        swipingLineView.frame.origin.y = navigationBar.frame.height - 1
    }
    
    
  
    
    lazy var followingButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(unselectedColor, for: .normal)
        button.setTitleColor(selectedColor, for: .selected)
        button.setTitle("Following", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    lazy var youButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(unselectedColor, for: .normal)
        button.setTitleColor(selectedColor, for: .selected)
        button.setTitle("You", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var swipingLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.frame.size = CGSize(width: UIScreen.main.bounds.width * 0.5, height: 1)
        return view
    }()
}
