//
//  RecipeGoSwiftUIApp.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI
import Firebase

@main
struct RecipeGoSwiftUIApp: App
{
    
    @StateObject var ViewModel = RecipeGoAuthViewModel()
    
    init()
    {
        FirebaseApp.configure()
    }
    
    var body: some Scene
    {
        WindowGroup
        {
            NavigationView
            {
                RecipeGoContentView()
            }
            .environmentObject(ViewModel)
        }
    }
}
