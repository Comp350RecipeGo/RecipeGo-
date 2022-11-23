//
//  RecipeGoFeedView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/22/22.
//

import SwiftUI

struct RecipeGoFeedView: View
{
    @State private var makeNewPostView = false
    @ObservedObject var ViewModel = RecipeGoFeedViewModel()
    
    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            ScrollView
            {
                LazyVStack
                {
                    ForEach(ViewModel.posts)
                    { post in
                        RecipeGoPostsView(post: post)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeGoFeedView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoFeedView()
    }
}
