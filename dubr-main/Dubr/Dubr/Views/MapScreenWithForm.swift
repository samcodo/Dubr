
import SwiftUI

//struct MapScreenWithForm: View {
//    @EnvironmentObject var rideStore: RideStore
//    @State var isPresentingRequestRide: Bool = false
//    @State var newRideEventFormData = RideEvent.RideEventFormData()
//
//    var body: some View {
//        MapScreen()
//            .sheet(isPresented: $isPresentingRequestRide) {
//                RequestRideView(selectedLocation: "Cocoa Cinnamon")
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            Button("Cancel") {
//                                isPresentingRequestRide = false
//                                newRideEventFormData = RideEvent.RideEventFormData()
//                            }
//                        }
//
//
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                          Button("Save") {
//                            let newRideEvent = RideEvent.create(from: newRideEventFormData)
//                            rideStore.createrideEvent(newRideEvent)
//                            newRideEventFormData = RideEvent.RideEventFormData()
//                            isPresentingRequestRide = false
//                          }
//                        }
//                    }
//            }
//    }
//}
