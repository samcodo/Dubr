//
//  DetailListButtonView.swift
//  Dubr
//
//  Created by Sydney Ballard on 4/22/23.
//

import Foundation
import SwiftUI


struct DetailListButtonView: View {
    var title: String
    var subtitle: String?
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                HStack {
                    Text(title).bold()
                        .font(.headline)
                }
                .padding(5)
                if (subtitle != nil) {
                    HStack {
                        Text(subtitle!)
                            .font(.subheadline)
                    }
                }
            }
            .foregroundColor(Color("Blue"))
            .padding()
            .frame(width: 350, height: 100)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color("Blue")))
            
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity)
        .padding(5)
    }
    
}
