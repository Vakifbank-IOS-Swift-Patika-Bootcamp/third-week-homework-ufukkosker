//
//  MainViewControllerDataProvider.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import Foundation

final class MainViewControllerDataProvider: MainViewControllerDataProviderProtocol {
    
    private let quotesAPI: QuotesFetchable
    
    init(quotesAPI: QuotesAPI) {
        self.quotesAPI = quotesAPI
    }
    
    func fetchQuotesRandom(request: RandomRequestModel, completion: @escaping (Result<QuotesRandomResponse, ApiError>) -> Void) {
        quotesAPI.quotesRandom(request: request, completion: completion)
    }
}
