//
//  RecipeGoContentView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoContentView: View
{
    @State private var displayMenu = false
    @EnvironmentObject var ViewModel: RecipeGoAuthViewModel
    
    var body: some View
    {
        Group
        {
            if ViewModel.userSession == nil
            {
                RecipeGoLoginView()
            }
            else
            {
                AuthUserContentView
            }
        }
    }
}

struct RecipeGoContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoContentView()
            .environmentObject(RecipeGoAuthViewModel())
    }
}

extension RecipeGoContentView
{
    var AuthUserContentView: some View
    {
        ZStack(alignment: .topLeading)
        {
            RecipeGoMainTabView()
                .navigationBarHidden(displayMenu)
            
            if displayMenu
            {
                ZStack
                {
                    Color(.black)
                        .opacity(displayMenu ? 0.25 : 0.0)
                }
                .onTapGesture
                {
                    withAnimation(.easeInOut)
                    {
                        displayMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            RecipeGoSideMenuView()
                .frame(width: 300)
                .offset(x: displayMenu ? 0 : -300, y: 0)
                .background(displayMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar
        {
            ToolbarItem(placement: .navigationBarLeading)
            {
                
                Button
                {
                    withAnimation()
                    {
                        displayMenu.toggle()
                    }
                }
                label:
                {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
                
                Spacer()
                
                
            }
        }
        .onAppear
        {
            displayMenu = false
        }
    }
}
