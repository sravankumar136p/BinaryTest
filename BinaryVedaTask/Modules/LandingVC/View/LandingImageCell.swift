//
//  LandingImageCell.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 06/11/21.
//

import UIKit
protocol LandingTopDelegate: class {
    func registerButtonTapped()
}
class LandingImageCell: UITableViewCell {

    @IBOutlet weak var registerBtn: UIButton!
    var viewProtocol: LandingTopDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    @IBAction func registerBtnTapped(_ sender: Any) {
        viewProtocol?.registerButtonTapped()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
