//
//  CollectionViewCell.swift
//  collectionViewHW
//
//  Created by Анна on 01.08.2020.
//  Copyright © 2020 anna. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "Cell"

    @IBOutlet weak var imageOfCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure( _ img: String, _ color: UIColor) {
        let img = UIImage(named: img)
        imageOfCell.image = img
        imageOfCell.contentMode = .scaleToFill
        imageOfCell.clipsToBounds = true
        self.backgroundColor = color
    }
}
