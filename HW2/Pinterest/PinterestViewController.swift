//
//  PinterestViewController.swift
//  HW2
//
//  Created by Aruzhan Zhakhan on 01.04.2023.
//

import UIKit

class PinterestViewController: UIViewController {
    let categories = ["Travel", "Food", "Fashion", "Design", "Nature", "Art"]
        let photos = [UIImage(named: "photo1"), UIImage(named: "photo2"), UIImage(named: "photo3"), UIImage(named: "photo4"), UIImage(named: "photo5"), UIImage(named: "photo6"), UIImage(named: "photo7"), UIImage(named: "photo8"), UIImage(named: "photo9"), UIImage(named: "photo10"), UIImage(named: "photo11"), UIImage(named: "photo12"), UIImage(named: "photo13"), UIImage(named: "photo14"), UIImage(named: "photo15")]
    lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

            collectionView.backgroundColor = .white
            collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
            collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
            return collectionView
        }()
//    lazy var categoriesCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    layout.scrollDirection = .horizontal
//    collectionView.showsHorizontalScrollIndicator = false
//        collectionView.backgroundColor = .white
//        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
//        return collectionView
//
//    }()
    lazy var tabBar: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor(red: 0.91, green: 0.28, blue: 0.29, alpha: 1.0)
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.backgroundColor = .white
        let homeVC = UIViewController()
            homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
            
            let followingVC = UIViewController()
            followingVC.tabBarItem = UITabBarItem(title: "Following", image: UIImage(systemName: "heart.fill"), tag: 1)
            
            let notificationsVC = UIViewController()
            notificationsVC.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell.fill"), tag: 2)
            
            let savedVC = UIViewController()
            savedVC.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "bookmark.fill"), tag: 3)
            
            tabBarController.viewControllers = [homeVC, followingVC, notificationsVC, savedVC]
            
            return tabBarController
    }()
    
    let searchController = UITextField()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pinterest"

        let headerView = UIView()
            headerView.backgroundColor = .white
            view.addSubview(headerView)
            headerView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(view.safeAreaLayoutGuide)
                make.height.equalTo(64)
            }
        
        
        
        let commentButton = UIButton(type: .system)
            commentButton.setImage(UIImage(systemName: "message"), for: .normal)
            headerView.addSubview(commentButton)
            commentButton.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(10)
                make.centerY.equalToSuperview()
            }
        commentButton.tintColor = .gray
        let addButton = UIButton(type: .system)
            addButton.setImage(UIImage(systemName: "plus"), for: .normal)
            headerView.addSubview(addButton)
            addButton.snp.makeConstraints { make in
               
                make.trailing.equalTo(commentButton.snp.leading).offset(-10)
                make.centerY.equalToSuperview()
            }
        addButton.tintColor = .gray
        let searchBar = UISearchBar()
            searchBar.placeholder = "Search"
            headerView.addSubview(searchBar)
            searchBar.snp.makeConstraints { make in
                make.trailing.equalTo(addButton.snp.leading).offset(-10)
                make.leading.equalToSuperview()
                make.top.bottom.equalToSuperview().inset(10)
                make.width.equalToSuperview().multipliedBy(0.7)
            }

        searchController.placeholder = "Search"

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
        addChild(tabBar)
        view.addSubview(tabBar.view)
        tabBar.view.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        tabBar.didMove(toParent: self)
                
                collectionView.dataSource = self
                collectionView.delegate = self
    }

}
extension PinterestViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categories.count
        } else {
            return photos.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.configure(with: categories[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
            cell.configure(with: photos[indexPath.row]!)
            return cell
        }
    }
    
}
extension PinterestViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = categories[indexPath.row].size(withAttributes: [.font: UIFont.systemFont(ofSize: 14, weight: .bold)]).width + 20
            return CGSize(width: width, height: 30)
        } else {
            let randomHeight = [200, 250, 300, 350, 400].randomElement()!
            return CGSize(width: (Int(collectionView.frame.width) - 18) / 2, height: randomHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 6, bottom: 6, right:6)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}

