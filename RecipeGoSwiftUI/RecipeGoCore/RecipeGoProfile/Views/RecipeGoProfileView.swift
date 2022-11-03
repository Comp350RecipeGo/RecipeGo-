//
//  RecipeGoProfileView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoProfileView: View
{
    @State private var selectFilter: RecipePostFilterViewModel = .RecipePosts
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            headerView
            
            actionButtons
            
            userInfo
            
            postFilterBar
            
            postView
            
            Spacer()
        }
    }
}

struct RecipeGoProfileView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoProfileView()
    }
}

extension RecipeGoProfileView
{
    var headerView: some View
    {
        ZStack(alignment: .bottomLeading)
        {
            Color(.systemGreen)
                .ignoresSafeArea()
            
            VStack
            {
                Button
                {
                    mode.wrappedValue.dismiss()
                }
            label:
                {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                Circle()
                    .frame(width:72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View
    {
        HStack(spacing: 12)
        {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button
            {
                
            }
        label:
            {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var userInfo: some View
    {
        VStack(alignment: .leading, spacing: 4)
        {
            HStack
            {
                Text("Bob Smith")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemGreen))
            }
            
            Text("@bsmith")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Professional Chief")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24)
            {
                HStack
                {
                    Image(systemName: "mapping.and.ellipse")
                    Text("Los Angeles, CA")
                }
                
                HStack
                {
                    Image(systemName: "link")
                    Text("www.bsmith.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            RecipeGoUserStatsView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var postFilterBar: some View
    {
        HStack
        {
            ForEach(RecipePostFilterViewModel.allCases, id: \.rawValue)
            {
                item in
                VStack
                {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectFilter == item ? .semibold : .regular)
                        .foregroundColor(selectFilter == item ? .black : .gray)
                    
                    if selectFilter == item
                    {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else
                    {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture
                {
                    withAnimation(.easeInOut)
                    {
                        self.selectFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var postView: some View
    {
        ScrollView
        {
            LazyVStack
            {
                ForEach(0 ... 9, id: \.self)
                {
                    _ in
                    RecipeGoPostsView()
                }
            }
        }
    }
}
