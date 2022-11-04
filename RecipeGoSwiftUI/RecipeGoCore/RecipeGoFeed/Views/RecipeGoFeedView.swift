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
    
    var body: some View
    {
        ZStack(alignment: .bottomTrailing)
        {
            ScrollView
            {
                LazyVStack
                {
                    ForEach(0 ... 20, id: \.self)
                    {
                        _ in
                        RecipeGoPostsView()
                    }
                }
            }
            
            Button
            {
                makeNewPostView.toggle()
            }
        label:
            {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 40, height: 40)
                    .padding()
            }
            .foregroundColor(.green)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $makeNewPostView) {
                RecipeGoNewPostView()
            }
        }
    }
}

struct RecipeGoFeedView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoFeedView()
    }
}
