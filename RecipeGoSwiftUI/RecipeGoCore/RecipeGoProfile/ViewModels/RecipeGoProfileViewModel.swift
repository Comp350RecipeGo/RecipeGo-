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
    @Published var postsPinned = [Post]()
    private let service = RecipeGoPostService()
    private let userService = RecipeGoUserService()
    
    let user: User
    
    init(user: User)
    {
        self.user = user
        self.fetchUserPosts()
        self.fetchPinnedPosts()
    }
   
    
    func posts(forFilter filter: RecipePostFilterViewModel) -> [Post] {
        switch filter{
        case .posts:
            return posts
        
        case .pins:
            return postsPinned
        }
        
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
    
    func fetchPinnedPosts() {
        guard let uid = user.id else { return }

        service.fetchPinnedPosts(forUid: uid) { posts in
            self.postsPinned = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.postsPinned[i].user = user
                }
            }
        }
    }
}

