// code from class

import Foundation
import CoreLocation




struct Location: Identifiable {
  let id: UUID = UUID()
  let name: String
  let coordinate: CLLocationCoordinate2D
  let lastVisit: Date?
}


let dateFormatter = DateFormatter()

extension Location {
  static let previewData = [
    Location(name: "Gross Hall", coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745), lastVisit: Date(timeIntervalSinceReferenceDate: 695916800)),
    Location(name: "Brodhead Center", coordinate: CLLocationCoordinate2D(latitude: 36.000720, longitude: -78.939482), lastVisit: nil),
    Location(name: "Physics Building", coordinate: CLLocationCoordinate2D(latitude: 36.003256, longitude: -78.942501), lastVisit: Date(timeIntervalSinceReferenceDate: 695916800)),
    Location(name: "Cocoa Cinnamon (Hillsborough Rd)", coordinate: CLLocationCoordinate2D(latitude: 36.011520, longitude: -78.930250), lastVisit: nil),
    Location(name: "Costco Wholesale", coordinate: CLLocationCoordinate2D(latitude: 36.029219, longitude: -78.913779), lastVisit: nil),
    Location(name: "Target (Durham Chapel Hill Blvd)", coordinate: CLLocationCoordinate2D(latitude: 35.966462, longitude: -78.959448), lastVisit: Date(timeIntervalSinceReferenceDate: 695916800)),
    Location(name: "UNC 🤮", coordinate: CLLocationCoordinate2D(latitude: 35.906710, longitude: -79.050086), lastVisit: Date(timeIntervalSinceReferenceDate: 695916800))
  ]
}

