//
//  RecipeGoPostsView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/22/22.
//

import SwiftUI

struct RecipeGoPostsView: View
{
    @ObservedObject var ViewModel: RecipeGoPostsViewModel
    
    init(post: Post)
    {
        self.ViewModel = RecipeGoPostsViewModel(post: post)
    }
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            //Profile image and user info and recipe post
            HStack(alignment: .top, spacing: 12)
            {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                //User info and Recipe post caption
                VStack (alignment: .leading, spacing: 4)
                {
                    //User info
                    if let user = ViewModel.post.user
                    {
                        HStack
                        {
                            Text(user.FullName)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.UserName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("3w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    //Recipe post caption
                    Text(ViewModel.post.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            //action buttons
            HStack
            {
                
                Button
                {
                    
                }
            label:
                {
                    Image(systemName: "square.and.arrow.up")
                            .font(.subheadline)
                }
                Spacer()
                
                Button
                {
                    ViewModel.post.postLiked ?? false ? ViewModel.unlikePost() : ViewModel.likePost()
                }
            label:
                {
                    Image(systemName: ViewModel.post.postLiked ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .padding(.horizontal, 6)
                        .foregroundColor(ViewModel.post.postLiked ?? false ? .red : .gray)
                }
                
                Button
                {
                    
                }
            label:
                {
                    Image(systemName: "bubble.right")
                        .font(.subheadline)
                        .padding(.horizontal, 6)
                }
                
                Button
                {
                    ViewModel.post.postPinned ?? false ? ViewModel.unpinPost() : ViewModel.pinnedPost()
                }
            label:
                {
                Image(systemName: ViewModel.post.postPinned ?? false ? "pin.fill" : "pin")
                    .font(.subheadline)
                    .padding(.horizontal, 6)
                    .foregroundColor(ViewModel.post.postPinned ?? false ? .red : .gray)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
}

