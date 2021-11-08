//
//  DynamicHeightCollectionView.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 07/11/21.
//

import Foundation
import UIKit

class DynamicHeightCollectionView: UICollectionView {

override func layoutSubviews() {

super.layoutSubviews()

if bounds.size != intrinsicContentSize {

self.invalidateIntrinsicContentSize()

}

}

override var intrinsicContentSize: CGSize {

return collectionViewLayout.collectionViewContentSize

}

}
