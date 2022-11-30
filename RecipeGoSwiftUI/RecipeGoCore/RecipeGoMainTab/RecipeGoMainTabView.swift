//
//  RecipeGoMainTabView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoMainTabView: View
{
    @State private var index = 0
    @EnvironmentObject var AuthViewModel: RecipeGoAuthViewModel
    
    var body: some View
    {
        if let user = AuthViewModel.currentUser
        {
            TabView(selection: $index)
            {
                RecipeGoFeedView()
                    .onTapGesture
                {
                    self.index = 0
                }
                .tabItem
                {
                    Image(systemName: "house")
                }
                .tag(0)
                
                RecipeGoExploreView()
                    .onTapGesture
                {
                    self.index = 1
                }
                .tabItem
                {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
                
                RecipeGoNewPostView()
                .onTapGesture
                {
                    self.index = 2
                        
                }
                .tabItem
                {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .tag(2)
                
                RecipeGoProfileView(user: user)
                    .onTapGesture
                {
                    self.index = 3
                }
                .tabItem
                {
                    Image(systemName: "person")
                }
                .tag(3)
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoMainTabView()
    }
}
