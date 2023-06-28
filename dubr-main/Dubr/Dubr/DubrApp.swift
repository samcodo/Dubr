//
//  DubrApp.swift
//  Dubr
//
//  Created by Sydney Ballard on 3/10/23.
//

import SwiftUI

@main
struct DubrApp: App {
    @StateObject var rideStore = RideStore()
    @StateObject var locationService = LocationService()
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            LoadingScreen(userData: userData)
                .environmentObject(rideStore)
                .environmentObject(locationService)
                .environmentObject(userData)
        }
    }
}
