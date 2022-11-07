//
//  RecipeGoUserService.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/7/22.
//

import Firebase
import FirebaseFirestoreSwift

struct RecipeGoUserService
{
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void)
    {
        Firestore.firestore().collection("Users")
            .document(uid)
            .getDocument{ snapshot, _ in
                guard let snapshot = snapshot else { return }

                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void)
    {
        Firestore.firestore().collection("Users")
            .getDocuments
        { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let users = documents.compactMap({ try? $0.data(as: User.self) })
                completion(users)
        }
    }
}
