//
//  userInputField.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/29/22.
//

import SwiftUI

struct UserInputField: View
{
    let image: String
    let placeholder: String
    var FieldIsSecure: Bool? = false
    @Binding var text: String
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if FieldIsSecure ?? false
                {
                    SecureField(placeholder, text: $text)
                }
                else
                {
                    TextField(placeholder, text: $text)
                }
            }
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct UserInputField_Previews: PreviewProvider
{
    static var previews: some View
    {
        UserInputField(image: "envelope",
                         placeholder: "Email",
                         FieldIsSecure: false,
                         text: .constant(""))
    }
}
