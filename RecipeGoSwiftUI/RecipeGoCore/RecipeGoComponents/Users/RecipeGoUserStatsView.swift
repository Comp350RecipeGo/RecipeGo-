//
//  RecipeGoUserStatsView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/26/22.
//

import SwiftUI

struct RecipeGoUserStatsView: View
{
    var body: some View
    {
        HStack(spacing: 24)
        {
            HStack(spacing: 4)
            {
                Text("807")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4)
            {
                Text("1M")
                    .font(.subheadline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct RecipeGoUserStatsView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoUserStatsView()
    }
}
