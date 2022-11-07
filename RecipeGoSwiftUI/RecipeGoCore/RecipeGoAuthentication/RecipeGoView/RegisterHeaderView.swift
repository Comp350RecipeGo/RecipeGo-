//
//  RegisterHeaderView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/29/22.
//

import SwiftUI

struct RegisterHeaderView: View
{
    let firstHeader: String
    let secondHeader: String
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            HStack
            {
                Spacer()
            }
            
            Text(firstHeader)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(secondHeader)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemGreen))
        .foregroundColor(.white)
        .clipShape(RoundCorners(corners: [.bottomRight]))
    }
}

struct RegisterHeaderView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RegisterHeaderView(firstHeader: "Hello,", secondHeader: "Welcome Back!")
    }
}
