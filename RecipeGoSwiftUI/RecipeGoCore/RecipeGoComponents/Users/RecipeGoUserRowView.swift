//
//  RecipeGoUserRowView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoUserRowView: View
{
    let user: User
    
    var body: some View
    {
        HStack(spacing: 12)
        {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4)
            {
                Text(user.UserName)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(user.FullName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
