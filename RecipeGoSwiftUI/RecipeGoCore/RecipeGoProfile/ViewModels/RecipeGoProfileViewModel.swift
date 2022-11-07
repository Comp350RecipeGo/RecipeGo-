//
//  RecipeGoProfileViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/7/22.
//

import Foundation

class RecipeGoProfileViewModel: ObservableObject
{
    @Published var posts = [Post]()
    private let service = RecipeGoPostService()
    let user: User
    
    init(user: User)
    {
        self.user = user
        self.fetchUserPosts()
    }
    
    func fetchUserPosts()
    {
        guard let uid = user.id else { return }
        
        service.fetchPosts(forUid: uid)
        { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count
            {
                self.posts[i].user = self.user
            }
        }
    }
}
