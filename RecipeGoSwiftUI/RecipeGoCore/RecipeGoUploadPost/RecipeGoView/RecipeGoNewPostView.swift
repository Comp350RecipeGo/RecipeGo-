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
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                Button
                {
                    ViewModel.uploadPost(withCaption: RecipeCaption)
                }
            label:
                {
                    Text("Share Recipe")
                        .bold()
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            .padding()
            
            HStack(alignment: .top)
            {
                
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
