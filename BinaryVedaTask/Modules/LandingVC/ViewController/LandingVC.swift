//
//  LandingVC.swift
//  BinaryVedaTask
//
//  Created by Sravan Kumar on 06/11/21.
//

import UIKit

class LandingVC: UIViewController {

    @IBOutlet weak var landignTableView: UITableView!
    var optionsModel = LandingDetailModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        updateDescriptionItems()
    }
    func registerCells() {
        landignTableView.register(UINib(nibName: "LandingImageCell", bundle: .main), forCellReuseIdentifier: "LandingImageCell")
        landignTableView.register(UINib(nibName: "LandingDetailsCell", bundle: .main), forCellReuseIdentifier: "LandingDetailsCell")
        landignTableView.register(UINib(nibName: "LandingBottomCell", bundle: .main), forCellReuseIdentifier: "LandingBottomCell")
        landignTableView.dataSource = self
        landignTableView.delegate = self
        landignTableView.tableFooterView = UIView()
    }
    private func updateDescriptionItems() {
        optionsModel.getListOptionsItems()
        self.landignTableView.reloadData()
    }
}
extension LandingVC: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 530
        }
        else if indexPath.section == 1 {
            return UITableView.automaticDimension
        }
        else if indexPath.section == 2 {
            return 280
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return optionsModel.getOptionsItemsCount()
        }
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LandingImageCell") as? LandingImageCell else {
                return UITableViewCell()
            }
            cell.viewProtocol = self
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LandingDetailsCell") as? LandingDetailsCell else {return UITableViewCell()}
            cell.setViewData(for: optionsModel.getOptionDetails(at: indexPath.row))
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LandingBottomCell") as? LandingBottomCell else {return UITableViewCell()}
            return cell
        default:
            return UITableViewCell()
        }
    }
}
extension LandingVC: LandingTopDelegate {
    func registerButtonTapped() {
        registerSelected()
    }
    func registerSelected() {
        let strory = UIStoryboard.init(name: "Main", bundle: nil)
        let profileVC = strory.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
}
