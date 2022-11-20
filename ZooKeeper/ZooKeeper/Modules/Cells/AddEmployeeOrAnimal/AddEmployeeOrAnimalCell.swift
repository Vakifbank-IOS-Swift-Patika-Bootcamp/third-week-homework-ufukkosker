//
//  AddEmployeeOrAnimalCell.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import UIKit

class AddEmployeeOrAnimalCell: UITableViewCell {

    @IBOutlet private weak var addAnimalButton: UIButton!
    @IBOutlet private weak var addEmployeeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTappedAddAnimalButton(_ sender: Any) {
        let nibName = String(describing: AddAnimalViewController.self)
        let dataProvider = AddAnimalViewControllerDataProvider()
        let viewModel = AddAnimalViewControllerViewModel(dataProvider: dataProvider)
        let vc = AddAnimalViewController(nibName: nibName, bundle: .main)
        vc.viewModel = viewModel
        UIApplication.getTopViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTappedAddEmployeeButton(_ sender: Any) {
        let nibName = String(describing: AddEmployeeViewController.self)
        let dataProvider = AddEmployeeViewControllerDataProvider()
        let viewModel = AddEmployeeViewControllerViewModel(dataProvider: dataProvider)
        let vc = AddEmployeeViewController(nibName: nibName, bundle: .main)
        vc.viewModel = viewModel
        UIApplication.getTopViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func config() {
        addAnimalButton.isHidden = !ZooManager.shared.isShowAddAnimalButton
    }
}

extension UIApplication {

    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)

        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)

        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
