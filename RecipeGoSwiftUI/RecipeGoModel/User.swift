//
//  User.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/7/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable
{
    @DocumentID var id: String?
    let UserName: String
    let FullName: String
    let Email: String
}
