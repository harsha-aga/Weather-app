//
//  ButtonView.swift
//  SwiftUI-weather
//
//  Created by Harsha Agarwal on 11/04/24.
//

import SwiftUI

struct LocationButton: View {
    
    var title: String
    var foregroundColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .foregroundStyle(foregroundColor)
            .padding(.horizontal, 32)
            .padding(.vertical, 12)
            .background(backgroundColor)
    }
}

