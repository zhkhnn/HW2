//
//  CategoryCell.swift
//  HW2
//
//  Created by Aruzhan Zhakhan on 02.04.2023.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .darkGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        contentView.layer.cornerRadius = 15
        
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with category: String) {
        label.text = category.uppercased()
    }
}
