//
//  MapSearchView.swift
//  Dubr
//
//  Created by Philjae Chang on 4/5/23.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    @Binding var tabSelection: Int
    @EnvironmentObject var locationService: LocationService
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.001427, longitude: -78.938232), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    @State var locations: [SelectedLocation] = []
    @Binding var destination: Location
    var body: some View {
        VStack {
          LocationSearchWidget()
          switch locationService.status {
          case .idle: MapContainer(locations: $locations, region: $region, tabSelection: $tabSelection, destination: $destination)
          default: SearchView(locations: $locations)
          }
        }
        .onChange(of: locations) { locations in
          region = LocationUtilities.coordinateRegion(for: locations.compactMap(\.placemark.location?.coordinate))
        }
    }
    
}

//struct MapSearchView_Previews: PreviewProvider {
//    static let locationService = LocationService()
//    static var previews: some View {
//        MapScreen(tabSelection: Binding.constant(2), locations: [])
//            .environmentObject(locationService)
//    }
//}

