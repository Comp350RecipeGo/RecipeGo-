//
//  RecipeGoExploreViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/7/22.
//

import Foundation

class RecipeGoExploreViewModel: ObservableObject
{
    @Published var users = [User]()
    @Published var searchText = ""
    
    var availableUsers: [User]
    {
        if searchText.isEmpty
        {
            return users
        }
        else
        {
            let lowercasedQery = searchText.lowercased()
            
            return users.filter(
                {
                    $0.UserName.contains(lowercasedQery) || $0.FullName.lowercased().contains(lowercasedQery)
                    
                }
            )
        }
    }
    
    let service = RecipeGoUserService()
    
    init()
    {
        fetchUsers()
    }
    
    func fetchUsers()
    {
        service.fetchUsers
        { users in
            self.users = users
        }
    }
}
