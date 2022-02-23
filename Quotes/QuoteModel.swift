//
//  QuoteModel.swift
//  Quotes
//
//  Created by Nathan Smith on 2022-02-22.
//


import Foundation
import System

// The Dadjoke structure confomrs to the Decodable Protocol. This means that we want Swift to be able to take a JSON object and 'decode' into an instance of this structure.
struct Quote: Decodable {
    let quoteText: String
    let quoteAuthor: String
    let senderName: String
    let quoteLink: String
}
