//
//  RecipePostFilterViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import Foundation

enum RecipePostFilterViewModel: Int, CaseIterable
{
    case posts
    case pins
    
    var title: String
    {
        switch self
        {
        case .posts: return "Recipe Posts"
        case .pins: return "Pins"
        }
    }
}
