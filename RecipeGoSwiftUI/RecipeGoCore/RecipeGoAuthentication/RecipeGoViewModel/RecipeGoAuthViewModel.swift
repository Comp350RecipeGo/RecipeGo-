//
//  RecipeGoAuthViewModel.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/29/22.
//

import SwiftUI
import Firebase

class RecipeGoAuthViewModel: ObservableObject
{
    @Published var userSession: FirebaseAuth.User?
    @Published var userAuthenticated = false
    
    init()
    {
        self.userSession = Auth.auth().currentUser
        print("ERROR: User session is \(String(describing: self.userSession?.uid))")
    }
    
    func login(WithEmail UserEmail: String, UserPassword: String)
    {
        Auth.auth().signIn(withEmail: UserEmail, password: UserPassword) { result, error in
            if let error = error
            {
                print("ERROR: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("User logged in")
        }
    }
    
    func register(WithEmail UserEmail: String, UserPassword: String, UserFullName: String, UserName: String)
    {
        Auth.auth().createUser(withEmail: UserEmail, password: UserPassword)
        {
            result, error in
            if let error = error
            {
                print("ERROR: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("User registered successfully")
            print("User is \(String(describing: self.userSession))")
            
            
            let dataDict = ["Email": UserEmail,
                            "UserName": UserName.lowercased(),
                            "FullName": UserFullName,
                            "uid": user.uid]
            
            Firestore.firestore().collection("Users")
                .document(user.uid)
                .setData(dataDict)
            {
                _ in
                self.userAuthenticated = true
            }
        }
    }
    
    func LogOut()
    {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
