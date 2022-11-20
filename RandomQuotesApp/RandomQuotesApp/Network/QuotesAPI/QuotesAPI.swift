//
//  QuotesFetchable.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import Foundation

protocol QuotesFetchable {
    func quotesRandom(request: RandomRequestModel, completion: @escaping (Result<QuotesRandomResponse, ApiError>) -> Void)
}

final class QuotesAPI: QuotesFetchable {
    
    private let networkManager: Networking
    
    init(networkManager: Networking) {
        self.networkManager = networkManager
    }
    
    func quotesRandom(request: RandomRequestModel, completion: @escaping (Result<QuotesRandomResponse, ApiError>) -> Void) {
        networkManager.request(request: request, completion: completion)
    }
}
