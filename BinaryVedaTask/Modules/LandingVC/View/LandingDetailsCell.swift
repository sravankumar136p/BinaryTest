//
//  LandingDetailsCell.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 06/11/21.
//

import UIKit

class LandingDetailsCell: UITableViewCell {
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var optionIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setViewData(for option: OptionsList) {
        titleLbl.text = option.optionTitle
        descriptionLbl.text = option.optionDescription
        optionIcon.image = option.optionIcon!
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
