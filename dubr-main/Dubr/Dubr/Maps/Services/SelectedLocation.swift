import Foundation
import CoreLocation
import MapKit

struct SelectedLocation: Identifiable, Equatable {
  static func == (lhs: SelectedLocation, rhs: SelectedLocation) -> Bool {
    lhs.id == rhs.id
  }

  let id: UUID = UUID()
  let coordinate: CLLocationCoordinate2D
  let placemark: MKPlacemark
}
