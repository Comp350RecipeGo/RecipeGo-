//
//  RecipeGoNewPostView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/28/22.
//

import SwiftUI

struct RecipeGoNewPostView: View
{
    @State private var RecipeCaption = ""
    @Environment(\.presentationMode) var presentationState
    @ObservedObject var ViewModel = RecipeGoUploadPostViewModel()
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Button
                {
                    presentationState.wrappedValue.dismiss()
                }
            label:
                {
                    Text("Cancel")
                        .foregroundColor(Color(.systemGreen))
                }
                
                Spacer()
                
                Button
                {
                    ViewModel.uploadPost(withCaption: RecipeCaption)
                }
            label:
                {
                    Text("Recipe Post")
                        .bold()
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                        .background(Color(.systemGreen))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top)
            {
                Circle()
                    .frame(width: 64, height: 64)
                
                
                RecipeGoTextView("Post your recipe here!", text: $RecipeCaption)
            }
            .padding()
        }
        .onReceive(ViewModel.$postUploaded)
        {
            uploadSuccessfull in
            if uploadSuccessfull
            {
                presentationState.wrappedValue.dismiss()
            }
        }
    }
}

struct RecipeGoNewPostView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoNewPostView()
    }
}
