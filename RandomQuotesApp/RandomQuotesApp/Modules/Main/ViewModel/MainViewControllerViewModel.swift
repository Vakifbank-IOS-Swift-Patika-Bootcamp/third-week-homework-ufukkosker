//
//  MainViewControllerViewModel.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import Foundation

final class MainViewControllerViewModel: MainViewControllerViewModelProtocol {
    var quotesRandom: QuotesRandomResponse = QuotesRandomResponse()
    var delegate: MainViewControllerDelegate?
    private let dataProvider: MainViewControllerDataProviderProtocol
    
    init(dataProvider: MainViewControllerDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
        fetchQuotesRandom(request: .init(randomPath: [Quotes.quotes.rawValue,Quotes.random.rawValue]))
    }
    
    func fetchQuotesRandom(request: RandomRequestModel) {
        LoadingManager.shared.show()
        dataProvider.fetchQuotesRandom(request: request) { result in
            LoadingManager.shared.hide()
            switch result {
            case .success(let response):
                self.quotesRandom = response
                self.notify(.fetchedQuotesRandom)
            case .failure(_):
                break
            }
        }
    }
    
    func didTappedFetchQuotesRandomButton() {
        fetchQuotesRandom(request: .init(randomPath: [Quotes.quotes.rawValue,Quotes.random.rawValue]))
    }
    
    private func notify(_ output: MainViewControllerOutput) {
        delegate?.handle(output: output)
    }
}
