//
//  ScheduledRides.swift
//  Dubr
//
//  Created by Sydney Ballard on 4/23/23.
//

import Foundation
import SwiftUI
import CoreLocation
import _MapKit_SwiftUI

struct ScheduledRides: View {
    var pickupLocation: String = "Chapel Loop"
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    UnclickableButtonView(title: "Costco", subtitle: "4/25 Pick up @ \(pickupLocation), 4pm")
                }
            }
        }
        .padding()
        .navigationTitle("Scheduled Rides")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color("Blue"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}
