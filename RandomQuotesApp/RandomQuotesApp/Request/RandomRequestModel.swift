//
//  RandomRequestModel.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import Foundation

final class RandomRequestModel: RequestModel {
    
    private var randomPath: [String]
    
    init(randomPath: [String]) {
        self.randomPath = randomPath
    }
    
    override var baseURL: String {
        Quotes.baseUrl.rawValue
    }
    
    override var path: [String] {
        randomPath
    }
    
    override var method: RequestMethod {
        .get
    }
}
 
