import SwiftUI
import CoreLocation

struct TabContainer: View {
    @StateObject var locationService = LocationService()
    @State private var tabSelection = 1
    @State var destination: Location = Location(name: "Cocoa Cinnamon", coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745), lastVisit: dateFormatter.date(from: "2022-12-10"))
    
    @State var rider: String = "pc1&&@duke.edu"
    @State var user: Passenger
    
    var body: some View {
        TabView (selection: $tabSelection) {
            ProfileView(user: user)
                .tabItem {
                    Label("My Profile", systemImage: "person.fill")
                }
                .tag(1)
            MapScreen(tabSelection: $tabSelection, destination: $destination)
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(2)
            RequestRideView(rider: $rider, destination: $destination, tabSelection: $tabSelection)
                .tabItem {
                    Label("Request Ride", systemImage: "car.fill")
                }
                .tag(3)
        }
    }
}

