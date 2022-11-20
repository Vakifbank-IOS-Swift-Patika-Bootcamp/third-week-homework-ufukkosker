//
//  Animal.swift
//  ZooKeeper
//
//  Created by Ufuk on 15.11.2022.
//

import Foundation
import UIKit

class Animal2 {
    var id: String?
    var name: String?
    var sound: String?
    var age: Double?
    var waterConsumption: Double?
    var animalType: AnimalType?
    var employee: Employee2?
    
    init(id: String? = nil, name: String? = nil, sound: String? = nil, age: Double? = nil, waterConsumption: Double? = nil, animalType: AnimalType? = nil) {
        self.id = id
        self.name = name
        self.sound = sound
        self.age = age
        self.waterConsumption = waterConsumption
        self.animalType = animalType
    }
}


enum AnimalType: String, CaseIterable {
    case monkey = "Monkey"
    case gorilla = "Gorilla"
    case orangutan = "Orangutan"
    case dog = "Dog"
    case serviceDog = "Service Dog"
    case poodle = "Poodle"
    case raccoon = "Raccoon"
    case cat = "Cat"
    case tiger = "Tiger"
    case leopard = "Leopard"
    case horse = "Horse"
    case cow = "Cow"
    case pig = "Pig"
    case zebra = "Zebra"
    case deer = "Deer"
    case ox = "Ox"
    case waterBuffalo = "Water Buffalo"
    case ram = "Ram"
    case ewe = "Ewe"
    case goat = "Goat"
    case camel = "Camel"
    case liama = "Lima"
    case giraffe = "Giraffe"
    case elephant = "Elephant"
    case rhinoceros = "Rhiinacceros"
    case hipopotamus = "Hipopotamus"
    case mouse = "Mouse"
    case rat = "Rat"
    case rabbit = "Rabbit"
    case bat = "Bat"
    case turkey = "Turkey"
    case rooster = "Rooster"
    case sloth = "Sloth"
    case skunk = "Skunk"
    case otter = "Otter"
    case kangoroo = "Kangoroo"
    case badger = "Badger"
    case duck = "Duck"
    case eagle = "Eagle"
    case owl = "Owl"
    case swan = "Swan"
    case parrot = "Parrot"
    case crocodile = "Crocodile"
    case turtle = "Turtle"
    case lizard = "Lizard"
    case snake = "Snake"
    case flamingo = "Flamingo"
    case shark = "Shark"
    case peacock = "Pearcock"
    case octopus = "Octopus"
    case dolphin = "Dolphin"
    case fish = "Fish"
    case blowfish = "Blow Fish"
    case bug = "Bug"
    case butterfly = "Butteryfly"
    case cricket = "Cricket"
    case ladyBeetle = "Lady Beetle"
    case ant = "Ant"
    case spider = "Spider"
    case scorpion = "Scorpion"
    case snail = "Snail"
    case none = ""
}

extension AnimalType {
    var animalIcon: String? {
        switch self {
        case .monkey:
            return "🐒"
        case .gorilla:
            return "🦍"
        case .orangutan:
            return "🦧"
        case .dog:
            return "🐕"
        case .serviceDog:
            return "🐕‍🦺"
        case .poodle:
            return "🐩"
        case .raccoon:
            return "🦝"
        case .cat:
            return "🐈"
        case .tiger:
            return "🐅"
        case .leopard:
            return "🐆"
        case .horse:
            return "🐎"
        case .cow:
            return "🐄"
        case .pig:
            return "🐖"
        case .zebra:
            return "🦓"
        case .deer:
            return "🦌"
        case .ox:
            return "🐂"
        case .waterBuffalo:
            return "🐃"
        case .ram:
            return "🐏"
        case .ewe:
            return "🐑"
        case .goat:
            return "🐐"
        case .camel:
            return "🐪"
        case .liama:
            return "🦙"
        case .giraffe:
            return "🦒"
        case .elephant:
            return "🐘"
        case .rhinoceros:
            return "🦏"
        case .hipopotamus:
            return "🦛"
        case .mouse:
            return "🐁"
        case .rat:
            return "🐀"
        case .rabbit:
            return "🐇"
        case .bat:
            return "🦇"
        case .turkey:
            return "🦃"
        case .rooster:
            return "🐓"
        case .sloth:
            return "🦥"
        case .skunk:
            return "🦨"
        case .otter:
            return "🦦"
        case .kangoroo:
            return "🦘"
        case .badger:
            return "🦡"
        case .duck:
            return "🦆"
        case .eagle:
            return "🦅"
        case .owl:
            return "🦉"
        case .swan:
            return "🦢"
        case .parrot:
            return "🦜"
        case .crocodile:
            return "🐊"
        case .turtle:
            return "🐢"
        case .lizard:
            return "🦎"
        case .snake:
            return "🐍"
        case .flamingo:
            return "🦩"
        case .shark:
            return "🦈"
        case .peacock:
            return "🦚"
        case .octopus:
            return "🐙"
        case .dolphin:
            return "🐬"
        case .fish:
            return "🐟"
        case .blowfish:
            return "🐡"
        case .bug:
            return "🐛"
        case .butterfly:
            return "🦋"
        case .cricket:
            return "🦗"
        case .ladyBeetle:
            return "🐞"
        case .ant:
            return "🐜"
        case .spider:
            return "🕷"
        case .scorpion:
            return "🦂"
        case .snail:
            return "🐌"
        case .none:
            return ""
        }
    }
    
    var salaryRatio: Double {
        switch self {
        case .monkey, .gorilla, .orangutan:
            return 1.5
        case .dog, .serviceDog, .poodle:
            return 1.5
        case .raccoon, .cat:
            return 1.4
        case .tiger, .leopard:
            return 3.5
        case .horse, .cow:
            return 1.7
        case .pig:
            return 1.8
        case .zebra, .deer, .ram, .ewe, .goat, .camel, .liama, .ox:
            return 1.9
        case .giraffe, .elephant, .rhinoceros, .hipopotamus, .waterBuffalo, .kangoroo, .crocodile:
            return 2.8
        case .mouse, .rat, .bat, .rabbit, .turkey:
            return 1.2
        case .rooster, .sloth, .skunk, .otter, .badger:
            return 1.5
        case .duck, .swan, .flamingo, .peacock:
            return 1.4
        case .eagle, .owl:
            return 2.4
        case .parrot:
            return 2.1
        case .turtle, .lizard:
            return 1.1
        case .snake:
            return 2.0
        case .shark:
            return 3.2
        case .octopus:
            return 2.8
        case .dolphin:
            return 2.7
        case .fish, .blowfish:
            return 1.6
        case .bug, .butterfly, .cricket, .ladyBeetle, .ant, .snail:
            return 1.7
        case .spider, .scorpion:
            return 1.9
        case .none:
            return 0.0
        }
    }
    
    var waterConsumption: Double {
        switch self {
        case .monkey, .gorilla, .orangutan:
            return 200.0
        case .dog, .serviceDog, .poodle:
            return 400.0
        case .raccoon, .cat:
            return 300.0
        case .tiger, .leopard:
            return 350.0
        case .horse, .cow:
            return 500.0
        case .pig:
            return 300.0
        case .zebra, .deer, .ram, .ewe, .goat, .camel, .liama, .ox:
            return 400.5
        case .giraffe, .elephant, .rhinoceros, .hipopotamus, .waterBuffalo, .kangoroo, .crocodile:
            return 500.5
        case .mouse, .rat, .bat, .rabbit, .turkey:
            return 200.0
        case .rooster, .sloth, .skunk, .otter, .badger:
            return 200.0
        case .duck, .swan, .flamingo, .peacock:
            return 200.5
        case .eagle, .owl:
            return 200.0
        case .parrot:
            return 200.0
        case .turtle, .lizard:
            return 300.0
        case .snake:
            return 200.0
        case .shark, .dolphin:
            return 500.0
        case .octopus:
            return 250.0
        case .fish, .blowfish:
            return 150.0
        case .bug, .butterfly, .cricket, .ladyBeetle, .ant, .snail:
            return 100.0
        case .spider, .scorpion:
            return 100.0
        case .none:
            return 0.0
        }
    }
}
