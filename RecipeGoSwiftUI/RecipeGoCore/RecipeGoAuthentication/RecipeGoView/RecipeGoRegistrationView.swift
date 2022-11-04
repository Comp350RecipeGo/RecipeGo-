//
//  RecipeGoRegistrationView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/29/22.
//

import SwiftUI

struct RecipeGoRegistrationView: View
{
    @State private var Email = ""
    @State private var UserName = ""
    @State private var FullName = ""
    @State private var Password = ""
    @Environment(\.presentationMode) var presentationState
    @EnvironmentObject var ViewModel: RecipeGoAuthViewModel
    
    var body: some View
    {
        VStack
        {
            
            RegisterHeaderView(firstHeader: "Get Started.", secondHeader: "Create your RecipeGo account")
            
            VStack(spacing: 40)
            {
                UserInputField(image: "envelope",
                                 placeholder: "Email",
                                 text: $Email)
                
                UserInputField(image: "person",
                                 placeholder: "Username",
                                 text: $UserName)
                
                UserInputField(image: "person",
                                 placeholder: "Full name",
                                 text: $FullName)
                
                UserInputField(image: "lock",
                                 placeholder: "Password",
                                 FieldIsSecure: true,
                                 text: $Password)
                
            }
            .padding(32)
            
            Button
            {
                ViewModel.register(WithEmail: Email,
                                   UserPassword: Password,
                                   UserFullName: FullName,
                                   UserName: UserName)
            }
        label:
            {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemGreen))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button
            {
                presentationState.wrappedValue.dismiss()
            }
        label:
            {
                HStack
                {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemGreen))
        }
        .ignoresSafeArea()
    }
}

struct RecipeGoRegistrationView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoRegistrationView()
    }
}
