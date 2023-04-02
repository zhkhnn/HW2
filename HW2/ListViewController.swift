//
//  ListViewController.swift
//  HW2
//
//  Created by Aruzhan Zhakhan on 02.04.2023.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    lazy var names:[String] = ["iCloud", "Microsoft Exchange", "Google", "yahoo!", "AoI.", "Outlook.com", "Other."]
    let scrollView = UIScrollView()
    let tableView = UITableView()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add contacts"
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        scrollView.addSubview(tableView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.backgroundColor = .white
        scrollView.layer.borderColor = UIColor.lightGray.cgColor
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self

        tableView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(500)
            make.top.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        scrollView.contentSize = tableView.frame.size
    }
    
    

}
extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

