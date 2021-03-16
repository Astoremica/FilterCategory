//
//  CountryCollectionViewCell.swift
//  test
//
//  Created by YoNa on 2021/03/12.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryLabel.layer.borderWidth = 0.5
        categoryLabel.layer.borderColor = UIColor.lightGray.cgColor
        categoryLabel.layer.cornerRadius = 15
        
    }
}
