//
//  LandingDetailModel.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 06/11/21.
//

import Foundation
import UIKit

struct OptionsList {
    let optionID: Int
    let optionTitle: String
    let optionDescription: String
    let optionIcon: UIImage?
    
    init(optionID: Int, optionTitle: String, optionDescription: String, optionIcon: UIImage?) {
        self.optionID = optionID
        self.optionTitle = optionTitle
        self.optionDescription = optionDescription
        self.optionIcon = optionIcon
    }
}
class LandingDetailModel {
    private var listOptionItems: [String]!
    var optionItems: [OptionsList] = [OptionsList]()
    
    public func getListOptionsItems() {
        let optionOne = OptionsList(optionID: 0, optionTitle: "lorem ipsum is used", optionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", optionIcon: UIImage(named: "optionOne"))
        let optionTwo = OptionsList(optionID: 1, optionTitle: "lorem ipsum is used", optionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", optionIcon: UIImage(named: "optionTwo"))
        let optionThree = OptionsList(optionID: 2, optionTitle: "lorem ipsum is used", optionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", optionIcon: UIImage(named: "optionThree"))
        let optionFour = OptionsList(optionID: 3, optionTitle: "lorem ipsum is used", optionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", optionIcon: UIImage(named: "optionFour"))
        let optionFive = OptionsList(optionID: 4, optionTitle: "lorem ipsum is used", optionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", optionIcon: UIImage(named: "optionFive"))
        let optionSix = OptionsList(optionID: 5, optionTitle: "lorem ipsum is used", optionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", optionIcon: UIImage(named: "optionSix"))
        let optionSeven = OptionsList(optionID: 6, optionTitle: "lorem ipsum is used", optionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", optionIcon: UIImage(named: "option7"))
        let optionEight = OptionsList(optionID: 7, optionTitle: "lorem ipsum is used", optionDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", optionIcon: UIImage(named: "option8"))
       
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
    func getOptionDetails(at position: Int) -> OptionsList {
        let optionItem = self.optionItems[position]
        return optionItem
    }
}
