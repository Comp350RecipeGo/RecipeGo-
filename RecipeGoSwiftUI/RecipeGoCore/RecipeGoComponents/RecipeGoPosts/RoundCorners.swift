//
//  RoundCorners.swift
//  RecipeGoSwiftUI
//
//  Created by Ramtin Saremi on 10/29/22.
//

import SwiftUI

struct RoundCorners: Shape
{
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path
    {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
}
