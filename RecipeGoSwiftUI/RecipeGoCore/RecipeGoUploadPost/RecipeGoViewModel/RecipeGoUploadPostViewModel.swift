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
    let service = RecipeGoPostService()
    
    func uploadPost(withCaption caption: String, withTitle title: String)
    {
        service.uploadPost(caption: caption, title: title)
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
