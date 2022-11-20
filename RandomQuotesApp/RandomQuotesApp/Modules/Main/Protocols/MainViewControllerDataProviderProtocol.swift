//
//  MainViewControllerDataProviderProtocol.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import Foundation

protocol MainViewControllerDataProviderProtocol {
    func fetchQuotesRandom(request: RandomRequestModel, completion: @escaping (Result<QuotesRandomResponse, ApiError>) -> Void)
}
