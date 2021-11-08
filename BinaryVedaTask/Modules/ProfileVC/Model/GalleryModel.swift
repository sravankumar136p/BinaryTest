//
//  GalleryModel.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 07/11/21.
//

import Foundation
import UIKit

struct GalleryList {
    let optionID: Int
    let optionIcon: UIImage?
    
    init(optionID: Int, optionIcon: UIImage?) {
        self.optionID = optionID
        self.optionIcon = optionIcon
    }
}
class GalleryModel {
    private var listOptionItems: [String]!
    var optionItems: [GalleryList] = [GalleryList]()
    
    public func getListOptionsItems() {
        let optionOne = GalleryList(optionID: 0, optionIcon: UIImage(named: "headerImage"))
        let optionTwo = GalleryList(optionID: 1, optionIcon: UIImage(named: "headerImage"))
        let optionThree = GalleryList(optionID: 2, optionIcon: UIImage(named: "optionThree"))
        let optionFour = GalleryList(optionID: 3, optionIcon: UIImage(named: "headerImage"))
        let optionFive = GalleryList(optionID: 4, optionIcon: UIImage(named: "headerImage"))
        let optionSix = GalleryList(optionID: 5, optionIcon: UIImage(named: "headerImage"))
        let optionSeven = GalleryList(optionID: 6, optionIcon: UIImage(named: "headerImage"))
        let optionEight = GalleryList(optionID: 7, optionIcon: UIImage(named: "headerImage"))
       
        optionItems.removeAll()
        optionItems.append(optionOne)
        optionItems.append(optionTwo)
        optionItems.append(optionThree)
        optionItems.append(optionFour)
        optionItems.append(optionFive)
        optionItems.append(optionSix)
        optionItems.append(optionSeven)
        optionItems.append(optionEight)
    }
    func getOptionsItemsCount() -> Int {
        return self.optionItems.count
    }
    func getOptionDetails(at position: Int) -> GalleryList {
        let optionItem = self.optionItems[position]
        return optionItem
    }
}
