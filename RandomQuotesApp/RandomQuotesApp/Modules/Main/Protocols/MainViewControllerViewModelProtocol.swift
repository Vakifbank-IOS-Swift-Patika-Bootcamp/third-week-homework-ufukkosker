//
//  MainViewControllerViewModelProtocol.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import Foundation

protocol MainViewControllerViewModelProtocol {
    var delegate: MainViewControllerDelegate? { get set }
    var quotesRandom: QuotesRandomResponse { get set }
    
    func viewDidLoad()
    func fetchQuotesRandom(request: RandomRequestModel)
    func didTappedFetchQuotesRandomButton()
}


enum MainViewControllerOutput {
    case fetchedQuotesRandom
}

protocol MainViewControllerDelegate {
    func handle(output: MainViewControllerOutput)
}
