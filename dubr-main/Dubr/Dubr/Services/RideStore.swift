
import Foundation

class RideStore: ObservableObject {
    
    @Published var rideEvents: [RideEvent] = RideEvent.previewData
    @Published var userProfiles: [User] = User.previewData
    
    func createRideEvent(_ rideEvent: RideEvent) {
        rideEvents.append(rideEvent)
    }
    
    func deleteRideEvent(_ rideEvent: RideEvent) {
        if let index = rideEvents.firstIndex(where: {$0.id == rideEvent.id }) {
            rideEvents.remove(at: index)
        }
    }
    
    func getRideEventsWithSameLocation(rider: String, selectedLocationName: String) -> [RideEvent] {
        
        rideEvents.filter { $0.location.name == selectedLocationName}
            .filter {$0.riderEmail != rider}
            .sorted {$0.time < $1.time}
    }
    
    func getRideEventsWithSameRider(rider: String) -> [RideEvent] {
        
        rideEvents.filter { $0.riderEmail == rider}
            .sorted {$0.time > $1.time}
    }
    
    //-----------------------------------------
    
    func createUser(_ user: User) {
        userProfiles.append(user)
    }
    
    func getUser(_ user: User) -> [User] {
        userProfiles.filter{ $0.userEmail == user.userEmail }
        //userProfiles.firstIndex(where: { $0.userEmail == user.userEmail })
    }
}



