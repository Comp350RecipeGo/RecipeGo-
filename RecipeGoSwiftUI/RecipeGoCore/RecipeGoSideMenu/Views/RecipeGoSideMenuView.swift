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
        VStack(alignment: .leading, spacing: 32)
        {
            VStack(alignment: .leading)
            {
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4)
                {
                    Text("Ramtin Saremi")
                        .font(.headline)
                    
                    Text("@ramtin1")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                RecipeGoUserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(RecipeGoSideMenuViewModel.allCases, id: \.rawValue)
            {
                viewModel in
                
                if viewModel == .RecipeGoProfile
                {
                    NavigationLink
                    {
                        RecipeGoProfileView()
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

struct RecipeGoSideMenuView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoSideMenuView()
    }
}
