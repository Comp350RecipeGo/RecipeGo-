//
//  RecipeGoSideMenuView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoSideMenuView: View
{
    @EnvironmentObject var AuthViewModel: RecipeGoAuthViewModel
    
    var body: some View
    {
        if let user = AuthViewModel.currentUser
        {
            VStack(alignment: .leading, spacing: 32)
            {
                VStack(alignment: .leading)
                {
                    Circle()
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4)
                    {
                        Text(user.FullName)
                            .font(.headline)
                        
                        Text("@\(user.UserName)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading)
                
                ForEach(RecipeGoSideMenuViewModel.allCases, id: \.rawValue)
                {
                    viewModel in
                    
                    if viewModel == .RecipeGoProfile
                    {
                        NavigationLink
                        {
                            RecipeGoProfileView(user: user)
                        }
                    label:
                        {
                            RecipeGoSideMenuOptionView(viewModel: viewModel)
                        }
                    }
                    else if viewModel == .RecipeGoLogout
                    {
                        Button
                        {
                            AuthViewModel.LogOut()
                        }
                    label:
                        {
                            RecipeGoSideMenuOptionView(viewModel: viewModel)
                        }
                    }
                    else
                    {
                        RecipeGoSideMenuOptionView(viewModel: viewModel)
                    }
                }
                Spacer()
            }
        }
    }
}

struct RecipeGoSideMenuView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoSideMenuView()
    }
}
