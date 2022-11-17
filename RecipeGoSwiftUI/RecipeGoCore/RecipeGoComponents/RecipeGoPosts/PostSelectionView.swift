//
//  PostSelectionView.swift
//  RecipeGoSwiftUI
//
//  Created by Matilda on 11/14/22.
//

import SwiftUI

struct PostSelectionView: View {
    
    @State private var makeNewPostView = false
    @ObservedObject var ViewModel = RecipeGoFeedViewModel()
    
    var body: some View {
        VStack{
            Button(action: {
                makeNewPostView.toggle()
                
            }, label: {
                Label(
                    title: {Text("Create New Recipe")},
                    icon: { Image (systemName: "square.and.pencil.circle.fill")}
                )
            })
            .bold()
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .fullScreenCover(isPresented: $makeNewPostView) {
                RecipeGoNewPostView()
            }
            Button(action: {}, label: {
                Label(
                    title: {Text("Import Recipe from URL")},
                    icon: { Image (systemName: "link")}
                )
            })
            .bold()
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .background(.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PostSelectionView()
    }
}
