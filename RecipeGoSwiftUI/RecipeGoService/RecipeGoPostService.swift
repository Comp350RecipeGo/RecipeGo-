//
//  RecipeGoPostService.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/1/22.
//

import Firebase

struct RecipeGoPostService
{
    func uploadPost(caption: String, completion: @escaping(Bool) -> Void)
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("Recipe posts").document()
            .setData(data)
        {
            errormessage in
            if let error = errormessage
            {
                print("DEBUG: Failed to upload post, error: \(error.localizedDescription)")
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func fetchPosts(completion: @escaping([Post]) -> Void)
    {
        Firestore.firestore().collection("Recipe posts")
            .order(by: "timestamp", descending: true)
            .getDocuments
        { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
            completion(posts)
        }
    }
    
    func fetchPosts(forUid uid: String, completion: @escaping([Post]) -> Void)
    {
        Firestore.firestore().collection("Recipe posts")
            .whereField("uid", isEqualTo: uid)
            .getDocuments
        { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
            completion(posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
        }
    }
}
