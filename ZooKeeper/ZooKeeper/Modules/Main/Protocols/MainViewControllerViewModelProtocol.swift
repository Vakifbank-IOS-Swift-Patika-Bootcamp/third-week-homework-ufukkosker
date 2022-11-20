//
//  MainViewControllerViewModelProtocol.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import Foundation

protocol MainViewControllerViewModelProtocol {
    var allEmployees: [Employee2] { get set }
    var zooBadgetStatus: ZooInfo { get set }
    var zooWaterStatus: ZooInfo { get set }
    var sectionTypes: [MainViewControllerSectionType] { get set }
    var delegate: MainViewControllerDelegate? { get set }
    
    func viewDidLoad()
    func fetchAllAnimals()
    func fetchAllEmployees()
    func fetchBadgetStatus()
    func fetchWaterStatus()
    func addBudget(_ price: Double)
    func addWater(_ lt: Double)
    func updateBadgetChart()
    func updateWaterChart()
}

enum MainViewControllerOutput {
    case fetchedAnimals
    case fetchedEmployee
    case fetchedZooStatus
    case addedBadgetCart
    case addedBadget
    case addedWaterCart
    case addedWater
    case didUpdatedBadgetChart
    case didUpdateWaterChart
    
}

enum MainViewControllerSectionType: String, CaseIterable {
    case description
    case badgetChart
    case salaryChart
    case waterChart
    case addButtons
    case addWaterButton
    case addBudgetButton
    case paySalaryButton
    case animalWithoutEmployee
    case seeEmployeeAndAnimalButton
}

protocol MainViewControllerDelegate {
    func handle(output: MainViewControllerOutput)
}
