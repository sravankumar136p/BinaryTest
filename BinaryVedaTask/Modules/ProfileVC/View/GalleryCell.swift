//
//  GalleryCell.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 06/11/21.
//

import UIKit
class ColumnFlowLayout: UICollectionViewFlowLayout {

    let cellsPerRow: Int

    init(cellsPerRow: Int, minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
        self.cellsPerRow = cellsPerRow
        super.init()

        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }
        let marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        itemSize = CGSize(width: itemWidth, height: itemWidth)
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }

}
class GalleryCell: UITableViewCell {

    @IBOutlet weak var galleryCollectionView: DynamicHeightCollectionView!
    var galleryModel = GalleryModel()
    let columnLayout = ColumnFlowLayout(
            cellsPerRow: 2,
            minimumInteritemSpacing: 10,
            minimumLineSpacing: 10,
            sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        )
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCell()
        updateGalleryItems()
    }
    private func updateGalleryItems() {
        galleryModel.getListOptionsItems()
        self.galleryCollectionView.reloadData()
    }
    private func registerCell() {
        self.galleryCollectionView.register(UINib(nibName: "GalleryCollectionCell", bundle: .main), forCellWithReuseIdentifier: "GalleryCollectionCell")
        self.galleryCollectionView.delegate = self
        self.galleryCollectionView.dataSource = self
        galleryCollectionView?.collectionViewLayout = columnLayout
        galleryCollectionView?.contentInsetAdjustmentBehavior = .always
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
extension GalleryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryModel.getOptionsItemsCount()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionCell", for: indexPath) as? GalleryCollectionCell else {
            return UICollectionViewCell()
        }
        cell.setViewData(for: galleryModel.getOptionDetails(at: indexPath.item))
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = (galleryCollectionView.frame.size.width - 30) / 2
//        return CGSize(width: size, height: size)
//    }
}

