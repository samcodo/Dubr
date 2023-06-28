//
//  MenuButtonView.swift
//  Dubr
//
//  Created by Sydney Ballard on 4/22/23.
//

import Foundation
import SwiftUI


struct MenuButtonView: View {
    var title: String
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("Blue"))
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
