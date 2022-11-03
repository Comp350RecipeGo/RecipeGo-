//
//  RecipeGoProfilePicView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 11/1/22.
//

import SwiftUI

struct RecipeGoProfilePicView: View
{
    var body: some View
    {
        VStack
        {
            RegisterHeaderView(firstHeader: "Create your account", secondHeader: "Upload a profile picture")
            
            Button
            {
                print("pick profile picture")
            }
        label:
            {
                Image("addImage")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemGreen))
                    .scaledToFit()
                    .frame(width: 120, height: 180)
                    .padding(44)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct RecipeGoProfilePicView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoProfilePicView()
    }
}
