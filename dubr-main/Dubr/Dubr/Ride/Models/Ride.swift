//
//  Ride.swift
//  Dubr
//
//  Created by Philjae Chang on 4/6/23.
//

import Foundation
import CoreLocation

struct Ride: Identifiable {
    let id: UUID = UUID()
    let PickUpLoc: Location
    let DropUpLoc: Location
    let time: Date
    // let DriverEmail: User.UUID
    // let Passengers: User.UUID
}

extension Ride {
    static let Cocoa = Location(name: "Cocoa Cinnamon", coordinate: CLLocationCoordinate2D(latitude: 36.0115807, longitude: -78.9301586))
    static let GrossHall = Location(name: "Gross Hall", coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745))
    static let Brodhead = Location(name: "Brodhead", coordinate: CLLocationCoordinate2D(latitude: 36.000720, longitude: -78.939482))
    
    
//    static let previewData = [
//        Ride(PickUpLoc: GrossHall, DropUpLoc: Cocoa, time: Date()
//    ]
}

