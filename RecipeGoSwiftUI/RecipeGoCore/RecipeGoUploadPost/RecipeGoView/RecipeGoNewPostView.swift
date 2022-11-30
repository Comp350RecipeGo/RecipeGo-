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
    @State var Title = ""

    @Environment(\.presentationMode) var presentationState
    @ObservedObject var ViewModel = RecipeGoUploadPostViewModel()

    var body: some View
    {

    VStack
    {
        HStack
        {
            Spacer()
            
            Button
            {
                ViewModel.uploadPost(withCaption: RecipeCaption, withTitle: Title)
            }
            label:
            {
                Text("Add")
                    .bold()
                    .foregroundColor(.green)
            }
        }
        .padding()
        
        HStack
        {
            Form
            {
                Section(header: Text("Recipe Details")) {
                    TextField("Name", text: $Title)
                }
                Section(header: Text("Directions")) {
                    TextField("...", text: $RecipeCaption)
                }
            }
        }
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

