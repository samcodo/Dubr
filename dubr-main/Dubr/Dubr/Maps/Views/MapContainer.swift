// modified code from class

import SwiftUI
import MapKit

struct MapContainer: View {
    @Binding var locations: [SelectedLocation]
    @Binding var region: MKCoordinateRegion
    @Binding var tabSelection: Int
    @Binding var destination: Location
    
    @State var tappedMapLocation: SelectedLocation?
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapAnnotation(coordinate: location.coordinate) {
                LocationAnnotation(selectedLocation: location, tappedMapLocation: $tappedMapLocation) }
        }
        .overlay(
            LocationOverlay(locations: $locations, tappedMapLocation: $tappedMapLocation, tabSelection: $tabSelection, destination: $destination)
        )
        
    }
    
}

struct LocationOverlay: View {
    @Binding var locations: [SelectedLocation]
    @Binding var tappedMapLocation: SelectedLocation?
    @Binding var tabSelection: Int
    @Binding var destination: Location
    var body: some View {
        Group {
            if let tappedLocation = tappedMapLocation {
                VStack {
                    Button(role: .destructive, action: { removeLocationTapped() }, label: { Image(systemName: "trash")})
                    Text(tappedLocation.placemark.name ?? "There was no name")
                    if let street = tappedLocation.placemark.thoroughfare {
                        Text(street)
                    }
                    HStack{
                        Button("Set as Destination") {
                            destination = Location(name: tappedLocation.placemark.name ?? "No Name Found", coordinate: tappedLocation.coordinate, lastVisit: Date())
                            tabSelection = 3}
                        Button("Close", role: .destructive) { tappedMapLocation = nil }
                    }
                }
                .padding()
                .background(Rectangle().foregroundColor(.white))
            } else {
                EmptyView()
            }
        }
    }


    func removeLocationTapped() {
        if let location = tappedMapLocation,
           let index = locations.firstIndex(where: { $0.id == location.id }) {
            locations.remove(at: index)
            tappedMapLocation = nil
        }
    }
}

struct LocationAnnotation: View {
    let selectedLocation: SelectedLocation
    @Binding var tappedMapLocation: SelectedLocation?
    
    var body: some View {
        VStack {
            Image(systemName: "mappin")
            Text(selectedLocation.placemark.name ?? "")
        }
        .foregroundColor(.red)
        .font(.headline)
        
        .padding(5)
        .background(RoundedRectangle(cornerRadius: 12).foregroundColor(Color(white: 0.9, opacity: 0.8)))
        
        .onTapGesture {
            tappedMapLocation = selectedLocation
        }
    }
}


struct MapContainer_Previews: PreviewProvider {
    static var previews: some View {
        MapContainer(locations: Binding.constant([]), region: Binding.constant(MKCoordinateRegion(.world)), tabSelection: Binding.constant(2), destination: Binding.constant(Location(name: "Gross Hall", coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745), lastVisit: Date.now)))
            .environmentObject(LocationService())
    }
}
