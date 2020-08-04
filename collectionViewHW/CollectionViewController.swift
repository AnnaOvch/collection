//
//  CollectionViewController.swift
//  collectionViewHW
//
//  Created by Анна on 01.08.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    private let sectionInsets0 = UIEdgeInsets(top: 20.0,
                                             left: 20.0,
                                             bottom: 20.0,
                                             right: 20.0)
    
    private let sectionInsets1 = UIEdgeInsets(top: 100.0,
                                                left: 100.0,
                                                bottom: 100.0,
                                                right: 100.0)
    
    private let itemsPerRow0: CGFloat = 2
    private let itemsPerRow1: CGFloat = 1
    
    
    
    lazy var imageNames: [String] = {
        var array = [String]()
        for i in 0..<7 {
            array.append(String(i+1))
        }
        return array
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CollectionViewCell" , bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        
        collectionView.backgroundColor = .black

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0:
            return 4
        case 1:
            return 3
        default:
            break
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as! CollectionViewCell
        let color = indexPath.section == 0 ? UIColor.systemBlue : UIColor.systemPink
        let  section = indexPath.section
        if section == 1 {

            cell.configure(imageNames[indexPath.row+4], color)
        } else {

            cell.configure(imageNames[indexPath.row], color)
        }
        return cell
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let paddingSpace = sectionInsets0.left * (itemsPerRow0 + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow0
            return CGSize(width: widthPerItem, height: widthPerItem)
        case 1:
            let paddingSpace = sectionInsets1.left * (itemsPerRow1 + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow1
            return CGSize(width: widthPerItem, height: widthPerItem)
        default:
            return CGSize(width: 0, height: 0)

        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        switch section {
//        case 0:
//            return sectionInsets0
//       case 1:
//            return sectionInsets1
//        default:
//            break
//        }
        return sectionInsets0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return 5
        case 1:
            return 50
        default:
            break
        }
        return 0
    }
}
