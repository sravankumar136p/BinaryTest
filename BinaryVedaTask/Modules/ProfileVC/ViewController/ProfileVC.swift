//
//  ProfileVC.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 06/11/21.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    var isUpload = true
    var isExhibition = false
    var isRevenue = false
    var imageBase64String = ""
    let imagePicker = UIImagePickerController()
    var selectedImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedImage = UIImage(named: "userIcon")!
        registerCells()
    }
    func registerCells() {
        profileTableView.register(UINib(nibName: "ProfileCell", bundle: .main), forCellReuseIdentifier: "ProfileCell")
        profileTableView.register(UINib(nibName: "GalleryCell", bundle: .main), forCellReuseIdentifier: "GalleryCell")
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.tableFooterView = UIView()
    }
}
extension ProfileVC: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 540
        }
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as? ProfileCell else {
                return UITableViewCell()
            }
            cell.delegate = self
            if isUpload {
                cell.uploadView.backgroundColor = .yellow
                cell.uploadView.isHidden = false
                cell.revenueView.isHidden = true
                cell.exhibitionView.isHidden = true
            }
            else if isRevenue {
                cell.revenueView.backgroundColor = .yellow
                cell.uploadView.isHidden = true
                cell.revenueView.isHidden = false
                cell.exhibitionView.isHidden = true
            }
            else {
                cell.exhibitionView.backgroundColor = .yellow
                cell.uploadView.isHidden = true
                cell.exhibitionView.isHidden = false
                cell.revenueView.isHidden = true
            }
            cell.profileUploadBtn.addTarget(self, action: #selector(imageUploadBtnAction(_:)), for: .touchUpInside)
            cell.userImage.layer.cornerRadius = cell.userImage.frame.size.width/2 
            if selectedImage != nil {
                cell.userImage.contentMode = .scaleToFill
                cell.userImage.image = selectedImage
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryCell") as? GalleryCell else {
                return UITableViewCell()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    @objc func imageUploadBtnAction(_ sender: Any?) {
        openAttachments(sender: sender as! UIButton)
    }
}
extension ProfileVC: GalleryDelegate {
    func objectSelected(isUpload: Bool, isExhibition: Bool, isRevenue: Bool) {
        if isUpload {
            self.isUpload = true
            self.isRevenue = false
            self.isExhibition = false
        }
        else if isExhibition {
            self.isUpload = false
            self.isRevenue = false
            self.isExhibition = true
        }
        else if isRevenue {
            self.isUpload = false
            self.isRevenue = true
            self.isExhibition = false
        }
        else {
            self.isUpload = true
            self.isRevenue = false
            self.isExhibition = false
        }
        profileTableView.reloadData()
    }
    
}
extension ProfileVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @objc func openAttachments(sender: UIButton) {
        let alert = UIAlertController(title: "Choose image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        /*If you want work actionsheet on ipad
         then you have to use popoverPresentationController to present the actionsheet,
         otherwise app will crash on iPad */
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender
            alert.popoverPresentationController?.sourceRect = sender.bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        self.present(alert, animated: true, completion: nil)
    }
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "warning", message: "We are not allowed to access to your gallery", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openCamera() {
        if UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            //            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            self.showAlert(for: "We are not allowed to access to your camera")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            
            selectedImage = pickedImage
            let imageData = self.selectedImage.jpegData(compressionQuality: 0.1)
            self.imageBase64String = imageData?.base64EncodedString() ?? ""
            self.profileTableView.reloadData()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated:  true, completion: nil)
    }
    func showAlert(for alert: String)  {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
