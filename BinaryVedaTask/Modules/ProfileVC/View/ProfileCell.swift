//
//  ProfileCell.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 06/11/21.
//

import UIKit
protocol GalleryDelegate: class {
    func objectSelected(isUpload: Bool, isExhibition: Bool, isRevenue: Bool)
}
class ProfileCell: UITableViewCell {

    @IBOutlet weak var profileUploadBtn: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var uploadView: UIView!
    @IBOutlet weak var exhibitionView: UIView!
    @IBOutlet weak var revenueView: UIView!
    @IBOutlet weak var revenueBtn: UIButton!
    @IBOutlet weak var revenueLbl: UILabel!
    @IBOutlet weak var revenueImage: UIImageView!
    @IBOutlet weak var exhibitionBtn: UIButton!
    @IBOutlet weak var exhibitionLbl: UILabel!
    @IBOutlet weak var exhibitionImage: UIImageView!
    @IBOutlet weak var uploaTitleLbl: UILabel!
    @IBOutlet weak var uploadImage: UIImageView!
    @IBOutlet weak var uploadBtn: UIButton!
    var delegate: GalleryDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBAction func uploadTapped(_ sender: Any) {
        delegate?.objectSelected(isUpload: true, isExhibition: false, isRevenue: false)
    }
    
    @IBAction func revenueTapped(_ sender: Any) {
        delegate?.objectSelected(isUpload: false, isExhibition: false, isRevenue: true)
    }
    @IBAction func exhibitionTapped(_ sender: Any) {
        delegate?.objectSelected(isUpload: false, isExhibition: true, isRevenue: false)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
