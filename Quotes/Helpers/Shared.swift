//
//  Shared.swift
//  Quotes
//
//  Created by Nathan Smith on 2022-02-24.
//

import Foundation

func getDocumentDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    return paths[0]
}

let savedFavouritesLabel = "savedFavourites"
