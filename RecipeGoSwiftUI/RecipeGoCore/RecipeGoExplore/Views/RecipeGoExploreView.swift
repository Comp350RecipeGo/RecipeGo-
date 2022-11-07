//
//  RecipeGoExploreView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoExploreView: View
{
    @ObservedObject var ViewModel = RecipeGoExploreViewModel()
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                RecipeGoSearchBar(text: $ViewModel.searchText)
                    .padding()
                
                ScrollView
                {
                    LazyVStack
                    {
                        ForEach(ViewModel.availableUsers, id: \.self)
                        { user in
                            NavigationLink
                            {
                                RecipeGoProfileView(user: user)
                            }
                        label:
                            {
                                RecipeGoUserRowView(user: user)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RecipeGoExploreView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoExploreView()
    }
}
