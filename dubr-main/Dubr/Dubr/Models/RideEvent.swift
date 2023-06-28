import Foundation
import CoreLocation
import UIKit

struct RideEvent: Identifiable {
    
    var id = UUID()
    var location: Location
    var pickup: Location?
    var time: Date
    var riderEmail: String? //array of strings?
    var driverEmail: String?
    
    struct RideEventFormData {
        var location: Location = Location(name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), lastVisit: nil)
        var pickup: Location = Location(name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), lastVisit: nil)
        var time: Date = Date()
        var riderEmail: String = ""
        var driverEmail: String = ""
    }
    
    var RideEventDataForForm: RideEventFormData {
        RideEventFormData(
            location: location,
            pickup: pickup ?? Location(name: "", coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0), lastVisit: nil),
            time: time,
            riderEmail: riderEmail ?? "",
            driverEmail: driverEmail ?? ""
        )
    }
    
    static func create(from RideEventFormData: RideEventFormData) -> RideEvent {
        let rideEvent = RideEvent(
            location: RideEventFormData.location,
            pickup: RideEventFormData.pickup,
            time: RideEventFormData.time,
            riderEmail: RideEventFormData.riderEmail,
            driverEmail: RideEventFormData.driverEmail
        )
        
        return RideEvent.update(rideEvent, from: RideEventFormData)
    }
    
    static func update(_ rideEvent: RideEvent, from formData: RideEventFormData) -> RideEvent {
        
        var rideEvent = rideEvent
        rideEvent.location = formData.location
        rideEvent.pickup = formData.pickup
        rideEvent.time = formData.time
        rideEvent.riderEmail = formData.riderEmail
        rideEvent.driverEmail = formData.driverEmail
        
        return rideEvent
    }
    
    static let previewData = [
        RideEvent(location: Location(name: "Gross Hall",
                                     coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745), lastVisit: dateFormatter.date(from: "11/01/23")),
                  pickup: Location(name: "Gross Hall",
                                          coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745), lastVisit: dateFormatter.date(from: "11/01/23")),
                  time: Date(timeIntervalSinceReferenceDate: 695914220),
                  riderEmail: "rider@duke.edu",
                  driverEmail: "driver@duke.edu"),
        RideEvent(location: Location(name: "Cocoa Cinnamon",
                                     coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745), lastVisit: dateFormatter.date(from: "11/02/23")),
                  pickup: Location(name: "Cocoa Cinnamon",
                                               coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745), lastVisit: dateFormatter.date(from: "11/02/23")),
                  time: Date(timeIntervalSinceReferenceDate: 695915120),
                  riderEmail: "rider@duke.edu",
                  driverEmail: "driver@duke.edu"),
        RideEvent(location: Location(name: "Insomnia Cookies",
                                     coordinate: CLLocationCoordinate2D(latitude: 36.0012249, longitude: -78.911719), lastVisit: dateFormatter.date(from: "11/03/23")),
                  pickup: Location(name: "Insomnia Cookies",
                                               coordinate: CLLocationCoordinate2D(latitude: 36.0012249, longitude: -78.911719), lastVisit: dateFormatter.date(from: "11/03/23")),
                  time: Date(timeIntervalSinceReferenceDate: 695916020),
                  riderEmail: "rider@duke.edu",
                  driverEmail: "driver@duke.edu"),
    ]
}
