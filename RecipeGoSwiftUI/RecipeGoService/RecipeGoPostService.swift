//
//  RecipeGoPostService.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/1/22.
//

import Firebase

struct RecipeGoPostService
{
    func uploadPost(postCaption: String, successful: @escaping(Bool) -> Void)
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": postCaption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("Recipe posts").document()
            .setData(data)
        {
            errormessage in
            if let error = errormessage
            {
                print("DEBUG: Failed to upload post, error: \(error.localizedDescription)")
                successful(false)
                return
            }
            successful(true)
        }
    }
}
