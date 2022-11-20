//
//  RequestModel.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import Foundation

class RequestModel {
    
    var baseURL: String {
        ""
    }
    
    var path : [String]{
        []
    }
    
    var parameters: [String: Any?] {
        [:]
    }
    
    var headers : [String: String] {
        [:]
    }
    
    var method: RequestMethod{
        .get
    }
    
    var body: [String: Any?] {
        [
            "accept": "application/json"
        ]
    }
}
