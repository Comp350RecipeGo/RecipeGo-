//
//  RecipeGoSideMenuOptionView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/26/22.
//

import SwiftUI

struct RecipeGoSideMenuOptionView: View
{
    let viewModel: RecipeGoSideMenuViewModel
    
    var body: some View
    {
        HStack(spacing: 16)
        {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.description)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct RecipeGoSideMenuOptionView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoSideMenuOptionView(viewModel: .RecipeGoProfile)
    }
}
