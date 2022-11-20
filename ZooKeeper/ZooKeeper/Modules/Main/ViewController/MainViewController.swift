//
//  MainViewController.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var mainTableView: UITableView!
    
    var viewModel: MainViewControllerViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Zoo Keeper 🦁"
        mainTableView.dataSource = self
        prepareCells()
        viewModel?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.fetchAllEmployees()
        viewModel?.updateBadgetChart()
        viewModel?.updateWaterChart()
    }
    
    func prepareCells() {
        let descriptionCellName = String(describing: ZooDescriptionCell.self)
        let descriptionCellNib = UINib(nibName: descriptionCellName, bundle: .main)
        mainTableView.register(descriptionCellNib, forCellReuseIdentifier: String(describing: ZooDescriptionCell.self))
        
        let chartCellName = String(describing: ChartCell.self)
        let chartCellNib = UINib(nibName: chartCellName, bundle: .main)
        mainTableView.register(chartCellNib, forCellReuseIdentifier: String(describing: ChartCell.self))
        
        let buttonsCellName = String(describing: AddEmployeeOrAnimalCell.self)
        let buttonCellNib = UINib(nibName: buttonsCellName, bundle: .main)
        mainTableView.register(buttonCellNib, forCellReuseIdentifier: buttonsCellName)
        
        let addWaterCellName = String(describing: AddWaterCell.self)
        let waterCellNib = UINib(nibName: addWaterCellName, bundle: .main)
        mainTableView.register(waterCellNib, forCellReuseIdentifier: String(describing: AddWaterCell.self))
        
        let addBudgetCellName = String(describing: AddBudgetCell.self)
        let budgetCellNib = UINib(nibName: addBudgetCellName, bundle: .main)
        mainTableView.register(budgetCellNib, forCellReuseIdentifier: String(describing: AddBudgetCell.self))
        
        let paySalaryCellName = String(describing: PayEmployeeSalaryCell.self)
        let paySalaryNib = UINib(nibName: paySalaryCellName, bundle: .main)
        mainTableView.register(paySalaryNib, forCellReuseIdentifier: String(describing: PayEmployeeSalaryCell.self))
        
        let seeAllEmployeeAndAnimalCellName = String(describing: SeeAllEmployeeAndAnimalCell.self)
        let seeAllEmployeeAndAnimalNib = UINib(nibName: seeAllEmployeeAndAnimalCellName, bundle: .main)
        mainTableView.register(seeAllEmployeeAndAnimalNib, forCellReuseIdentifier: String(describing: SeeAllEmployeeAndAnimalCell.self))
    }
}

extension MainViewController: MainViewControllerDelegate {
    func handle(output: MainViewControllerOutput) {
        switch output {
        case .fetchedAnimals:
            mainTableView.reloadData()
        case .fetchedEmployee:
            mainTableView.reloadData()
        case .addedBadget:
            mainTableView.reloadData()
        case .addedWater:
            mainTableView.reloadData()
        case .fetchedZooStatus:
            mainTableView.reloadData()
        case .addedBadgetCart:
            mainTableView.reloadData()
        case .addedWaterCart:
            mainTableView.reloadData()
        case .didUpdatedBadgetChart:
            mainTableView.reloadData()
        case .didUpdateWaterChart:
            mainTableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sectionTypes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel?.sectionTypes[indexPath.row] {
        case .description:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ZooDescriptionCell.self), for: indexPath) as? ZooDescriptionCell {
                return cell
            }
        case .badgetChart:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChartCell.self), for: indexPath) as? ChartCell {
                guard let zooBadgetStatus = viewModel?.zooBadgetStatus
                else { return UITableViewCell() }
                cell.config(with: zooBadgetStatus)
                cell.layoutIfNeeded()
                return cell
            }
        case .salaryChart:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChartCell.self), for: indexPath) as? ChartCell {
                return cell
            }
        case .waterChart:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChartCell.self), for: indexPath) as? ChartCell {
                guard let zooWaterStatus = viewModel?.zooWaterStatus
                else { return UITableViewCell() }
                cell.config(with: zooWaterStatus)
                cell.layoutIfNeeded()
                return cell
            }
        case .addButtons:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AddEmployeeOrAnimalCell.self), for: indexPath) as? AddEmployeeOrAnimalCell {
                cell.config()
                return cell
            }
        case .addWaterButton:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AddWaterCell.self), for: indexPath) as? AddWaterCell {
                cell.delegate = self
                return cell
            }
        case .addBudgetButton:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AddBudgetCell.self), for: indexPath) as? AddBudgetCell {
                cell.delegate = self
                return cell
            }
        case .paySalaryButton:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PayEmployeeSalaryCell.self), for: indexPath) as? PayEmployeeSalaryCell {
                cell.delegate = self
                return cell
            }
        case .seeEmployeeAndAnimalButton:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SeeAllEmployeeAndAnimalCell.self), for: indexPath) as? SeeAllEmployeeAndAnimalCell {
                cell.employees = viewModel?.allEmployees ?? []
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
}

extension MainViewController: AddWaterCellDelegate {
    func didTappedAddWather(_ lt: Double) {
        viewModel?.addWater(lt)
    }
}

extension MainViewController: AddBudgetCellDelegate {
    func didTappedAddBudget(price: Double) {
        viewModel?.addBudget(price)
    }
}

extension MainViewController: PayEmployeeSalaryCellDelegate {
    func didTappedPaySalaryButton() {
        print("foo didTappedPay")
    }
}
