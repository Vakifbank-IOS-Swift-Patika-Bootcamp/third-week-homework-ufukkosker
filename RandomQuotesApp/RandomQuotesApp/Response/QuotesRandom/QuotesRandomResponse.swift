//
//  QuotesRandomResponse.swift
//  RandomQuotesApp
//
//  Created by Ufuk on 20.11.2022.
//

import Foundation

struct QuotesRandomResponse: Codable {

    let id: String?
    let author: String?
    let en: String?
    
    init(id: String? = "", author: String? = "", en: String? = "") {
        self.id = id
        self.author = author
        self.en = en
    }
}
