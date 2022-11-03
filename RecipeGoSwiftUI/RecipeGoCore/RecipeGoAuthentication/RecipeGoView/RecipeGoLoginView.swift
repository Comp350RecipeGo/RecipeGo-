//
//  RecipeGoLoginView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/29/22.
//

import SwiftUI

struct RecipeGoLoginView: View
{
    @State private var Email = ""
    @State private var Password = ""
    @EnvironmentObject var ViewModel: RecipeGoAuthViewModel
    
    var body: some View
    {
        VStack
        {
            VStack(alignment: .leading)
            {
                HStack
                {
                    Spacer()
                }
                
                Text("Hello.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemGreen))
            .foregroundColor(.white)
            .clipShape(RoundCorners(corners: [.bottomRight]))
            
            VStack(spacing: 40)
            {
                UserInputField(image: "envelope",
                                 placeholder: "Email",
                                 text: $Email)
                
                UserInputField(image: "lock",
                                 placeholder: "Password",
                                 FieldIsSecure: true,
                                 text: $Password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack
            {
                Spacer()
                
                NavigationLink
                {
                    Text("Reset password")
                }
            label:
                {
                    Text("Forgot password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemGreen))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button
            {
                ViewModel.login(WithEmail: Email,
                                UserPassword: Password)
            }
        label:
            {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemGreen))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5),
                    radius: 10,
                    x: 0,
                    y: 0)
            
            Spacer()
            
            NavigationLink
            {
                RecipeGoRegistrationView()
                    .navigationBarHidden(true)
            }
        label:
            {
                HStack
                {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemGreen ))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct RecipeGoLoginView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoLoginView()
    }
}
