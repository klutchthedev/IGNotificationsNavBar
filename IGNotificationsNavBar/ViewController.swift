//
//  ViewController.swift
//  IGNotificationsNavBar
//
//  Created by Adrian Navarro on 3/22/19.
//  Copyright © 2019 Adrian Navarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    
    var notificationNavController = NotificationsNavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationNavController = self.navigationController as! NotificationsNavigationController
        addNavBarButtonActions()
        
        
        setupContainerCollectionView()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func addNavBarButtonActions() {
        notificationNavController.youButton.addTarget(self, action: #selector(youButttonTapped), for: .touchUpInside)
        notificationNavController.followingButton.addTarget(self, action: #selector(followingButtonTapped), for: .touchUpInside)
    }
    
    
    
    func swipeViewRight() {
        UIView.animate(withDuration: 0.3) {
            self.notificationNavController.swipingLineView.frame.origin.x = self.view.frame.width * 0.5
        }
        notificationsContainerCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func swipeViewLeft() {
        UIView.animate(withDuration: 0.3) {
            self.notificationNavController.swipingLineView.frame.origin.x = 0
        }
        notificationsContainerCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)

    }
    
    
    @objc func youButttonTapped() {
        print("You")
        notificationNavController.youButton.isSelected = true
        notificationNavController.followingButton.isSelected = false 
        swipeViewRight()
    }
    
    @objc func followingButtonTapped() {
        print("Following")
        notificationNavController.youButton.isSelected = false
        notificationNavController.followingButton.isSelected = true
        swipeViewLeft()
    }
    
    
    lazy var notificationsContainerCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    
    
    
    
    
    
    


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let containerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "containerCell", for: indexPath) as? ContainerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.row == 0 {
            containerCell.backgroundColor = .red
        } else {
            containerCell.backgroundColor = .blue
        }
        
        
        return containerCell
    }
    
    func setupContainerCollectionView() {
        self.view.addSubview(notificationsContainerCollectionView)
        notificationsContainerCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        notificationsContainerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        notificationsContainerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        notificationsContainerCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        
        
        self.view.layoutIfNeeded()
       
        let containerCollectionViewLayout = UICollectionViewFlowLayout()
        containerCollectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        containerCollectionViewLayout.minimumLineSpacing = 0
        containerCollectionViewLayout.minimumInteritemSpacing = 0
        containerCollectionViewLayout.scrollDirection = .horizontal
        
        containerCollectionViewLayout.itemSize = CGSize(width: notificationsContainerCollectionView.frame.width, height: notificationsContainerCollectionView.frame.height)
        notificationsContainerCollectionView.collectionViewLayout = containerCollectionViewLayout
        
        notificationsContainerCollectionView.register(ContainerCollectionViewCell.self, forCellWithReuseIdentifier: "containerCell")
        notificationsContainerCollectionView.delegate = self
        notificationsContainerCollectionView.dataSource = self
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("StartingScroll")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("DoneScrolling")
       
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         print("Offset:", scrollView.contentOffset.x)
        let xOffset = scrollView.contentOffset.x
        moveSlidingViewTo(x: xOffset)
        
        
    }
    
    
    func moveSlidingViewTo(x offset: CGFloat) {
        notificationNavController.swipingLineView.frame.origin.x = offset * 0.5
        if offset > view.frame.width * 0.5 {
            notificationNavController.youButton.isSelected = true
            notificationNavController.followingButton.isSelected = false
        } else {
            notificationNavController.youButton.isSelected = false
            notificationNavController.followingButton.isSelected = true
        }
    }
    
    
    
}

