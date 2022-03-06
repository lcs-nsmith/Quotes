//
//  FavouritesListView.swift
//  Quotes
//
//  Created by Nathan Smith on 2022-03-06.
//

import SwiftUI

struct FavouritesListView: View {
    // MARK: Stored Properties
    @State var favourites: [Quote] = []
    
    // MARK: Computed Properties
    var body: some View {
        List (favourites, id: \.self ) { currentFavourite in
                Text(currentFavourite.quoteText)
                Text(currentFavourite.quoteAuthor)
                .font(.footnote)
            }
    }
}

struct FavouritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesListView()
    }
}
