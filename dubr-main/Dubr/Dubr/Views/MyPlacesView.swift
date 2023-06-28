//
//  MyPlacesView.swift
//  Dubr
//
//  Created by Sydney Ballard on 4/12/23.
//

import Foundation
import SwiftUI

struct MyPlacesView: View {
    @EnvironmentObject var rideStore: RideStore
    @State var locations: [Location] = Location.previewData
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                
                ForEach($locations, id: \.id) { $location in
                    HStack {
                        DetailListButtonView(title: $location.wrappedValue.name, destination: AnyView(RequestRideView(rider: Binding.constant("rider@email.com"), destination: $location, tabSelection: Binding.constant(3))))
                    }
                }
            }
        }
        .padding()
        .navigationTitle("My Places")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color("Blue"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
