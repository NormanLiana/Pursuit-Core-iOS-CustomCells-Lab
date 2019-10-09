//
//  UserCVController.swift
//  ProgrammaticUserCells
//
//  Created by Liana Norman on 10/9/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class UserCVController: UICollectionViewController {
    
    // MARK: UI Objects
    
    // MARK: Properties
    var people = [User]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UserCVCell.self, forCellWithReuseIdentifier: "UserCVCell")
        loadData()
    }

    // MARK: Private Methods
    private func loadData() {
        UsersFetchingService.manager.getUsers { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let usersFromOnline):
                    self.people = usersFromOnline
                }
            }
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCVCell", for: indexPath) as? UserCVCell {
            let person = people[indexPath.row]
            cell.nameLabel.text = "\(person.name.first) \(person.name.last)"
            cell.backgroundColor = .white
            ImageHelper.shared.getImage(urlStr: person.picture.large) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let imageFromOnline):
                        cell.userImageView.image = imageFromOnline
                    }
                }
            }
            return cell
        }
        return UICollectionViewCell()
    }
    

  
    
}

extension UserCVController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}

