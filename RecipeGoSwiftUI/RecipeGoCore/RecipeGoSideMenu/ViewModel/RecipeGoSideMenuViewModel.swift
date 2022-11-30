//
//  RecipeGoSideMenuViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import Foundation

enum RecipeGoSideMenuViewModel: Int, CaseIterable
{
    case RecipeGoProfile
//    case RecipeGoLists
//    case RecipeGoBookmarks
    case RecipeGoLogout
    
    var description: String
    {
        switch self
        {
        case .RecipeGoProfile: return "Profile"
//        case .RecipeGoLists: return "Lists"
//        case .RecipeGoBookmarks: return "Bookmarks"
        case .RecipeGoLogout: return "Logout"
        }
    }
    
    var imageName: String
    {
        switch self
        {
        case .RecipeGoProfile: return "person"
//        case .RecipeGoLists: return "list.bullet"
//        case .RecipeGoBookmarks: return "bookmark"
        case .RecipeGoLogout: return "arrow.left.square"
        }
    }
}
