//
//  UserCVCell.swift
//  ProgrammaticUserCells
//
//  Created by Liana Norman on 10/9/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class UserCVCell: UICollectionViewCell {
    
    // MARK: UIObjects
    lazy var nameLabel: UILabel = {
      let theLabel = UILabel()
        return theLabel
    }()
    
    var userImageView: UIImageView = {
        let theImage = UIImageView()
        return theImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupObjects()
        configureNameLabelConstraints()
        configureImageViewContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupObjects() {
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(userImageView)
    }
    
    func configureNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor), nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor), nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor), nameLabel.heightAnchor.constraint(equalToConstant: 30)].forEach{ $0.isActive = true }
        
        
        
        
    }
    
    func configureImageViewContraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        
        [userImageView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor), userImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor), userImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor), userImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)].forEach { $0.isActive = true }
    
    }
    

}
