//
//  RecipeGoProfileView.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/25/22.
//

import SwiftUI

struct RecipeGoProfileView: View
{
    @State private var selectFilter: RecipePostFilterViewModel = .posts
    @ObservedObject var ViewModel: RecipeGoProfileViewModel
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    init(user: User)
    {
        self.ViewModel = RecipeGoProfileViewModel(user: user)
    }
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            headerView
            
            actionButtons
            
            userInfo
            
            postFilterBar
            
            postsView
            
            Spacer()
        }
    }
}

/*struct RecipeGoProfileView_Previews: PreviewProvider
{
    static var previews: some View
    {
        RecipeGoProfileView(user: User(id: NSUUID().uuidString,
                                      UserName: "batman",
                                      FullName: "Bruce Wayne",
                                       Email: "batman@gmail.com"))
    }
}*/

extension RecipeGoProfileView
{
    var headerView: some View
    {
        ZStack(alignment: .bottomLeading)
        {
            Color(.systemGreen)
                .ignoresSafeArea()
            
//            VStack
//            {
//                Circle()
//                    .frame(width:72, height: 72)
//                    .offset(x: 16, y: 24)
//            }
        }
        .frame(height: 88)
    }
    
    var actionButtons: some View
    {
        HStack(spacing: 12)
        {
            Spacer()
            
//            Button
//            {
//
//            }
//            label:
//            {
//                Image(systemName: "gearshape")
//                    .foregroundColor(.blue)
//                    .padding(.vertical, 1)
//
//            }
        }
        .padding(.trailing)
    }
    
    var userInfo: some View
    {
        VStack(alignment: .leading, spacing: 4)
        {
            HStack
            {
                Text(ViewModel.user.FullName)
                    .font(.title3).bold()
                Spacer()
               
            }
            
            Text("@\(ViewModel.user.UserName)")
                .font(.subheadline)
                .foregroundColor(.gray)
        
            Text("Professional Chief")
                .font(.subheadline)
                .padding(.vertical, 2)
            
            HStack(spacing: 20)
            {
                HStack
                {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Los Angeles, CA")
                }
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.vertical, 5)
            
            RecipeGoUserStatsView()
            .padding(.vertical, 10)
              
        }
        .padding(.horizontal)
    }
    
    var postFilterBar: some View
    {
        // TODO insert option for collections
        HStack
        {
            ForEach(RecipePostFilterViewModel.allCases, id: \.rawValue)
            { item in
                VStack
                {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectFilter == item ? .semibold : .regular)
                        .foregroundColor(selectFilter == item ? .black : .gray)
                    
                    if selectFilter == item
                    {
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else
                    {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 2)
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
    
    var postsView: some View
    {
        ScrollView
        {
            LazyVStack
            {
                ForEach(ViewModel.posts(forFilter: self.selectFilter))
                { post in
                    RecipeGoPostsView(post: post)
                        .padding()
                }
            }
        }
    }
}
