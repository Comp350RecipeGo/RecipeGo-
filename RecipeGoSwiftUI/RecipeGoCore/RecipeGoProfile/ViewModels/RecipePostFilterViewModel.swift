//
//  RecipePostFilterViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import Foundation

enum RecipePostFilterViewModel: Int, CaseIterable
{
    case RecipePosts
    case collections
    
    var title: String
    {
        switch self
        {
        case .RecipePosts: return "Recipe Posts"
        case .collections: return "Collections"
        }
    }
}
