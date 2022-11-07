//
//  RecipeGoSearchBar.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/7/22.
//

import SwiftUI

struct RecipeGoSearchBar: View
{
    @Binding var text: String
    
    var body: some View
    {
        HStack
        {
            TextField("Search for recipes...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack
                    {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
        }
        .padding(.horizontal, 4)
    }
}

struct RecipeGoSearchBar_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoSearchBar(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
