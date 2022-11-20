//
//  MainViewControllerViewModel.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import Foundation

class MainViewControllerViewModel: MainViewControllerViewModelProtocol {
    
    var allEmployees: [Employee2] = []
    var zooBadgetStatus: ZooInfo = ZooInfo()
    var zooWaterStatus: ZooInfo = ZooInfo()
    var sectionTypes: [MainViewControllerSectionType] = []
    var delegate: MainViewControllerDelegate?
    private let dataProvider: MainViewControllerDataProviderProtocol
    
    init(dataProvider: MainViewControllerDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
        sectionTypes.append(.description)
        sectionTypes.append(.addBudgetButton)
    }
    
    func fetchAllAnimals() {
        dataProvider.fetchAllAnimals { animals in
            ZooManager.shared.animals = animals
            notify(.fetchedAnimals)
        }
    }
    
    func fetchAllEmployees() {
        dataProvider.fetchAllEmployees { employees in
            if !employees.isEmpty {
                allEmployees = employees
                if !sectionTypes.contains(where: {$0 == .seeEmployeeAndAnimalButton}) {
                    sectionTypes.append(.seeEmployeeAndAnimalButton)
                }
                notify(.fetchedEmployee)
            }
        }
    }
    
    func fetchBadgetStatus() {
        dataProvider.fetchBadgetStatus { zoo in
            zooBadgetStatus = prepareBadgetValue(with: zoo)
            sectionTypes.append(.badgetChart)
            notify(.addedBadgetCart)
        }
    }
    
    func fetchWaterStatus() {
        dataProvider.fetchWaterStatus { zoo in
            zooWaterStatus = prepareWaterConsumptionValue(with: zoo)
            sectionTypes.append(.waterChart)
            notify(.addedWaterCart)
        }
    }
    
    func addBudget(_ price: Double) {
        dataProvider.addBudget(price) {
            fetchBadgetStatus()
            if let index = sectionTypes.firstIndex(where: {$0 == .addBudgetButton}) {
                sectionTypes.remove(at: index)
            }
            sectionTypes.append(.addWaterButton)
            notify(.addedBadget)
        }
    }
    
    func addWater(_ lt: Double) {
        dataProvider.addWater(lt) {
            fetchWaterStatus()
            if let index = sectionTypes.firstIndex(where: {$0 == .addWaterButton}) {
                sectionTypes.remove(at: index)
            }
            sectionTypes.append(.addButtons)
            notify(.addedWater)
            updateBadgetChart()
        }
    }
    
    func updateBadgetChart() {
        dataProvider.updateBadgetChart { zoo in
            zooBadgetStatus = prepareBadgetValue(with: zoo)
            notify(.didUpdatedBadgetChart)
        }
    }
    
    func updateWaterChart() {
        dataProvider.updateWaterChart { zoo in
            zooWaterStatus = prepareWaterConsumptionValue(with: zoo)
            notify(.didUpdateWaterChart)
        }
    }
    
    private func prepareBadgetValue(with model: Zoo) -> ZooInfo {
        .init(title: "Badget", totalValue: model.totalBudget, currentValue: model.currentBudget, icon: .badgetImage, color: .badgeColor)
    }
    
    private func prepareWaterConsumptionValue(with model: Zoo) -> ZooInfo {
        .init(title: "Water", totalValue: model.totalWaterConsumption, currentValue: model.currentWaterConsumption, icon: .watherImage, color: .waterColor)
    }
    
    private func notify(_ output: MainViewControllerOutput) {
        delegate?.handle(output: output)
    }
}
