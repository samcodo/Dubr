import Foundation
struct Passenger {
    var firstName: String = "NA"
    var lastName: String = "NA"
    var netIdEmail: String = "NA"
    var username: String = "NA"
    var password: String = "NA"
}

class UserData: ObservableObject {
    @Published var existingUsers = [Passenger(firstName: "Sam", lastName: "Rivera", netIdEmail: "sfr11@duke.edu", username: "sfr11", password: "badpassword")]
}
