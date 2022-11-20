//
//  Employee.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import Foundation

class Employee2 {
    var id: String?
    var name: String?
    var lastName: String?
    var age: Int?
    var gender: GenderType?
    var salary: Double?
    var experienceYear: ExperienceYear?
    var animals: [Animal2]
    
    init(id: String? = nil, name: String? = nil, lastName: String? = nil, age: Int? = nil, gender: GenderType? = nil, salary: Double? = nil, experienceYear: ExperienceYear? = nil, animals: [Animal2] = []) {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.age = age
        self.gender = gender
        self.salary = salary
        self.experienceYear = experienceYear
        self.animals = animals
    }
}

enum GenderType: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case none = ""
    
    var genderIconForHuman: String {
        switch self {
        case .male:
            return "🙎🏻‍♂️"
        case .female:
            return "👩🏻"
        case .none:
            return ""
        }
    }
    
    var genderIconForAnimal: String {
        switch self {
        case .male:
            return "♂"
        case .female:
            return "♀"
        case .none:
            return ""
        }
    }
}

enum ExperienceYear: String, CaseIterable {
    case lessThanOneYear = "0"
    case oneYear = "1"
    case twoYear = "2"
    case threeYear = "3"
    case fourYear = "4"
    case fiveYear = "5"
    case moreThanFiveYear = "5+"
    case none = ""
    
    var description: String {
        switch self {
        case .lessThanOneYear:
            return "less than one year"
        case .oneYear:
            return "one year"
        case .twoYear:
            return "two year"
        case .threeYear:
            return "three year"
        case .fourYear:
            return "four year"
        case .fiveYear:
            return "five year"
        case .moreThanFiveYear:
            return "more than five year"
        case .none:
            return ""
        }
    }
    
    var salaryRation: Double {
        switch self {
        case .lessThanOneYear:
            return 1.0
        case .oneYear:
            return 1.2
        case .twoYear:
            return 1.3
        case .threeYear:
            return 1.4
        case .fourYear:
            return 1.5
        case .fiveYear:
            return 1.6
        case .moreThanFiveYear:
            return 1.7
        case .none:
            return 0.0
        }
    }
}

enum SalaryType: String, CaseIterable {
    case twoThousand = "2000"
    case threeThousand = "3000"
    case fourThousand = "4000"
    case fiveThousand = "5000"
    case none = ""
    
    var description: String {
        switch self {
        case .twoThousand:
            return "₺₺"
        case .threeThousand:
            return "₺₺₺"
        case .fourThousand:
            return "₺₺₺₺"
        case .fiveThousand:
            return "₺₺₺₺₺"
        case .none:
            return ""
        }
    }
}
