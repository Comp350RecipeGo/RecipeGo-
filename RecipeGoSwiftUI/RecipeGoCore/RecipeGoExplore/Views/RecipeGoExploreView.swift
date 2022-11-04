//
//  RecipeGoExploreView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoExploreView: View
{
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                ScrollView
                {
                    LazyVStack
                    {
                        ForEach(0 ... 25, id: \.self)
                        {
                            _ in
                            NavigationLink
                            {
                                RecipeGoProfileView()
                            }
                        label:
                            {
                                RecipeGoUserRowView()
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
