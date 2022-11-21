//
//  RecipeGoPostsView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/22/22.
//

import SwiftUI

struct RecipeGoPostsView: View
{
    let post: Post
    
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
                    if let user = post.user
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
                    Text(post.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            //action buttons
            HStack
            {
                
                Button
                {
                    shareButton()
                }
            label:
                {
                    Image(systemName: "square.and.arrow.up")
                            .font(.subheadline)
                }
                Spacer()
                
                Button
                {
                    
                }
            label:
                {
                    Image(systemName: "heart")
                        .font(.subheadline)
                        .padding(.horizontal, 6)
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
                    
                }
            label:
                {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                        .padding(.horizontal, 6)
                }
            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
        .padding()
    }
    
    func shareButton() {
           let url = "https://www.discord.com"
           let av = UIActivityViewController(activityItems: [url], applicationActivities: nil)
           UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
       }
    
}

