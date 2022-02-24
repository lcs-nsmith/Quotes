//
//  QuoteModel.swift
//  Quotes
//
//  Created by Nathan Smith on 2022-02-22.
//


import Foundation
import System


struct Quote: Decodable, Hashable, Encodable {
    let quoteText: String
    let quoteAuthor: String
}
