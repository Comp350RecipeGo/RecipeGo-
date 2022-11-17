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
            
            Button
            {
                makeNewPostView.toggle()
            }
        label:
            {
                Image(systemName: "square.and.pencil.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 40, height: 40)
                    .padding()
            }
            .foregroundColor(Color(.systemGreen))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $makeNewPostView) {
                RecipeGoNewPostView()
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
