//
//  SwiftUIView.swift
//  Dubr
//
//  Created by Philjae Chang on 4/4/23.
//

import SwiftUI
import CoreLocation

struct RequestRideView: View {
    
    @Binding var rider: String
    
    @ScaledMetric var boxSpace = 30
    @State var driveIsClicked: Bool = false
    @State var rideIsClicked: Bool = false

    @Binding var destination: Location
    @Binding var tabSelection: Int
    @State var date = Date()

    @EnvironmentObject var rideStore: RideStore
    //@State var newRideEvent = RideEvent.RideEventFormData()
    @State var newRideForm = RideEvent.RideEventFormData()
    

    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Destination:")
                        .font(.headline)
                        .foregroundColor(Color("Blue"))
                    Spacer()
                }
                .padding([.leading, .trailing, .top])
//                .padding(.top)
                
                
                Button(action: {
                    tabSelection = 2
                }) {
                    Text(destination.name)
                        .frame(minWidth: 0, maxWidth: 350)
                        .font(.system(size: 18))
                        .padding([.top, .bottom])
                        .foregroundColor(Color("Blue"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                }
                
                HStack{
                    Text("Ride or Drive?")
                        .font(.headline)
                        .foregroundColor(Color("Blue"))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding([.leading, .trailing])
                
                HStack(spacing: boxSpace){
                    Button(action: {
                        rideIsClicked.toggle()
                        driveIsClicked = false
                    }) {
                        Image(systemName: "figure.walk")
                    }.buttonStyle(RideOrPickupButtonStyle())
                        .foregroundColor(!rideIsClicked ? Color("Blue") : .white)
                        .background(rideIsClicked ? Color("Blue") : .white)
                        .cornerRadius(5)
                        
                    Button(action: {driveIsClicked.toggle()
                        rideIsClicked = false

                    }) {
                        Image(systemName: "car.fill")
                    }.buttonStyle(RideOrPickupButtonStyle())
                        .foregroundColor(!driveIsClicked ? Color("Blue") : .white)
                        .background(driveIsClicked ? Color("Blue") : .white)
                        .cornerRadius(5)
                }
                HStack{
                    Text("When do you want to go?")
                        .font(.headline)
                    .foregroundColor(Color("Blue"))
                    Spacer()
                }
                .padding([.leading, .trailing])
                
                DatePickerForRequest(date: $date)
                
                Button(action: {
                    newRideForm.location = destination
                    newRideForm.time = date
                    newRideForm.riderEmail = rider
                    
                    let newRide = RideEvent.create(from: newRideForm)
                    rideStore.createRideEvent(newRide)
                    print(rideStore.rideEvents)
                    print(rideStore.getRideEventsWithSameLocation(rider: rider, selectedLocationName: destination.name))
                }, label: {
                    NavigationLink(destination: MatchingView(rides: Binding.constant(RideEvent.previewData))){
                        Text("Let's go!")
                    }
                }
                )
                .buttonStyle(FilledButton())
                
                Spacer()
//                    .padding()
            }
            .navigationTitle("Submit New Request")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color("Blue"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}


struct DatePickerForRequest: View {
    
    @Binding var date: Date
    
    let currentDate = Date()
    let sixtyDaysFromNow = Date().advanced(by: 5400000)
    
    var body: some View {
        DatePicker(
            "select time",
            selection: $date,
            in: Date()...sixtyDaysFromNow,
            displayedComponents: [.date, .hourAndMinute])
            .datePickerStyle(.wheel)
            .labelsHidden()
            .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
            .scaleEffect()
    }
}

struct RideOrPickupButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
    configuration.label
          .frame(maxWidth: 100, maxHeight: 100)
          .aspectRatio(1, contentMode: .fill)
          .font(.system(size: 20))
          .overlay(
              RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.gray, lineWidth: 0.5)
          )
          
  }
}

struct FilledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : .white)
            .padding()
            .background(Color("LightOrange"))
            .opacity(configuration.isPressed ? 0.7 : 1)
            .cornerRadius(5)
            .font(.system(size: 20))
            .padding(.top)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RequestRideView(rider: Binding.constant("pc1&&@duke.edu"), destination: Binding.constant(Location(name: "Cocoa Cinnamon", coordinate: CLLocationCoordinate2D(latitude: 36.001312, longitude: -78.944745), lastVisit: Date.now)), tabSelection: Binding.constant(3))
    }
}

