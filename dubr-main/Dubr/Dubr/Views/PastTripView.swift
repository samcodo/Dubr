//
//  PastTripView.swift
//  Dubr
//
//  Created by Sydney Ballard on 4/12/23.
//


import Foundation
import SwiftUI
import CoreLocation
import _MapKit_SwiftUI

struct PastTripView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    
                    ForEach(Location.previewData, id: \.id) { location in
                        if (location.lastVisit != nil) {
                            HStack {
                                UnclickableButtonView(title: location.name, subtitle: "Last visited: \(String(location.lastVisit!.formatted(.dateTime.day().month().year())))")
                            }
                        }
                    }
                    
                    
                }
            }
        }
        
        .padding()
        .navigationTitle("Past Trips")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color("Blue"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
