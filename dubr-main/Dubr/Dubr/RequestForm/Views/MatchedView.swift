//
//  MatchedView.swift
//  Dubr
//
//  Created by Philjae Chang on 4/22/23.
//

import SwiftUI

struct MatchedView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Ride Booked!")
                    .font(.title)
                    .foregroundColor(Color("Blue"))
            }
            .navigationTitle("Confirmation")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color("Blue"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
        
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
