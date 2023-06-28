import Foundation
import CoreLocation
import UIKit

struct User: Identifiable {
    
    var id = UUID()
    var userEmail: String
    
    static let previewData = [User(userEmail: "pc1&&@duke.edu")]
}
