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
    let timestamp: Timestamp
    let uid: String
    var user: User?
}
