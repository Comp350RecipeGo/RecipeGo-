//
//  RecipeGoUserRowView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoUserRowView: View
{
    var body: some View
    {
        HStack(spacing: 12)
        {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4)
            {
                Text("bsmith")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Bob Smith")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoUserRowView()
    }
}
