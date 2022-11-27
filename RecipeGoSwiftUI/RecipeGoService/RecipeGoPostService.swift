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
    
    func likePost(_ post: Post, completion: @escaping() -> Void)
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        
        let userLikesReference = Firestore.firestore().collection("Users")
            .document(uid)
            .collection("User-likes")
        
        Firestore.firestore().collection("Recipe posts").document(postId)
            .updateData(["likes": post.likes + 1])
        { _ in
            userLikesReference.document(postId).setData([:])
            { _ in
                completion()
            }
        }
    }
    
    func checkLikedPosts(_ post: Post, completion: @escaping(Bool) -> Void)
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        
        Firestore.firestore().collection("Users")
            .document(uid)
            .collection("User-likes")
            .document(postId).getDocument
        { snapshot, _ in
            guard let snapshot = snapshot else { return }
            completion(snapshot.exists)
        }
    }
    
    func unlikePost (_ post: Post, completion: @escaping() -> Void)
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        guard post.likes > 0 else { return }
        
        let userLikesReference = Firestore.firestore().collection("Users").document(uid).collection("User-likes")
        
        Firestore.firestore().collection("Recipe posts").document(postId)
            .updateData(["likes": post.likes - 1])
        { _ in
            userLikesReference.document(postId).delete
            { _ in
                completion()
            }
        }
    }
}
