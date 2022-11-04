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
    case comments
    case likes
    
    var title: String
    {
        switch self
        {
        case .RecipePosts: return "Recipe Posts"
        case .comments: return "Comments"
        case .likes: return "Likes"
        }
    }
}
