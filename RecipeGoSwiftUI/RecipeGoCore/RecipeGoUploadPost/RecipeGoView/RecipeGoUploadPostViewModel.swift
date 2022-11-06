//
//  RecipeGoUploadPostViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/1/22.
//

import Foundation

class RecipeGoUploadPostViewModel: ObservableObject
{
    @Published var postUploaded = false
    let postService = RecipeGoPostService()
    
    func uploadPost(withCaption caption: String)
    {
        postService.uploadPost(postCaption: caption)
        {
            uploadSuccessfull in
            if uploadSuccessfull
            {
                self.postUploaded = true
            }
            else
            {
                
            }
        }
    }
}
