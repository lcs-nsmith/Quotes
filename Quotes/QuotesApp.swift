//
//  QuotesApp.swift
//  Quotes
//
//  Created by Nathan Smith on 2022-02-22.
//

import SwiftUI

@main
struct QuotesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
            QuoteView()
            }
        }
    }
}
