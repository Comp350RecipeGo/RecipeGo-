//
//  RecipeGoFeedViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/7/22.
//

import Foundation

class RecipeGoFeedViewModel: ObservableObject
{
    @Published var posts = [Post]()
    let service = RecipeGoPostService()
    let userService = RecipeGoUserService()
    
    init()
    {
        fetchPosts()
    }
    
    func fetchPosts()
    {
        service.fetchPosts
        { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count
            {
                let uid = posts[i].uid
                
                self.userService.fetchUser(withUid: uid)
                { user in
                    self.posts[i].user = user
                }
            }
        }
    }
}
