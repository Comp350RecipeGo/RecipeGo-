//
//  RecipeGoPostsViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/22/22.
//

import Foundation

class RecipeGoPostsViewModel: ObservableObject
{
    private let service = RecipeGoPostService()
    @Published var post: Post
    
    init(post: Post)
    {
        self.post = post
        checkLikedPosts()
        checkPinnedPosts()
    }
    
    func likePost()
    {
        service.likePost(post)
        {
            self.post.postLiked = true
        }
    }
    
    func checkLikedPosts()
    {
        service.checkLikedPosts(post)
        { postLiked in
            if postLiked
            {
                self.post.postLiked = true
            }
        }
    }
    
    func unlikePost()
    {
        service.unlikePost(post)
        {
            self.post.postLiked = false
        }
    }
    
    func pinnedPost()
    {
        service.pinnedPost(post)
        {
            self.post.postPinned = true
        }
    }
    
    func checkPinnedPosts()
    {
        service.checkPinnedPosts(post)
        { postPinned in
            if postPinned
            {
                self.post.postPinned = true
            }
        }
    }
    func unpinPost()
    {
        service.unpinPost(post)
        {
            self.post.postPinned = false
        }
    }
    
}
