//
//  GalleryCollectionCell.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 07/11/21.
//

import UIKit

class GalleryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var galleryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setViewData(for option: GalleryList) {
        galleryImageView.image = option.optionIcon!
    }
}
