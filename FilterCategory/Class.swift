//
//  Class.swift
//  test
//
//  Created by YoNa on 2021/03/12.
//
import UIKit

class LeftAlignedCellsCustomFlowLayout:UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

//get an array of UICollectionViewLayoutAttributes for all the cells
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left

        var maxY: CGFloat = 2.0

        let horizontalSpacing:CGFloat = 10

//Modify the UICollectionViewLayoutAttributes for each cell
        attributes?.forEach { layoutAttribute in

            if layoutAttribute.frame.origin.y >= maxY
                || layoutAttribute.frame.origin.x == sectionInset.left {

                leftMargin = sectionInset.left
            }

            if layoutAttribute.frame.origin.x == sectionInset.left {
                leftMargin = sectionInset.left
            }else {
                layoutAttribute.frame.origin.x = leftMargin
            }

            leftMargin += layoutAttribute.frame.width + horizontalSpacing

            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
//return the array of modified UICollectionViewLayoutAttributes
        return attributes
    }
    
}
