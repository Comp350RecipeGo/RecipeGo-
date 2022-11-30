//
//  Post.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/7/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable, Hashable
{
    @DocumentID var id: String?
    let caption: String
    var likes: Int
    var pins: Int
    let timestamp: Timestamp
    let uid: String
    var user: User?
    var postLiked: Bool? = false
    var postPinned: Bool? = false
}
