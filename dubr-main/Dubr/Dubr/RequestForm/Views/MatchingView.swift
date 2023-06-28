//
//  MatchingView.swift
//  Dubr
//
//  Created by Philjae Chang on 4/22/23.
//

import SwiftUI

struct MatchingView: View {
    // change this to binding later
    @Binding var rides: [RideEvent]
    @State public var buttonSelected: Int?
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Drivers found: ")
                        .font(.title)
                    .foregroundColor(Color("MainGreen"))
                    Spacer()
                }
                .padding()
                
                ForEach(0..<rides.count) {ride in
                    Button(action:{
                        self.buttonSelected = ride
                    }){
                        TripButtonView(time: rides[ride].time, pickup: "Swift Apartments", dropoff: "Cocoa Cinnamon")
                            .foregroundColor(self.buttonSelected == ride ? .white: Color("Blue"))
                                                .background(self.buttonSelected == ride ? Color("Blue") : Color.white)
                                                .cornerRadius(10)

                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(maxWidth: .infinity)
                    .padding(5)
                }
                
                LetsGoButtonView(title: "Confirm", destination: AnyView(MatchedView()))
                Spacer()
            }
            .navigationTitle("Find a match")
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(Color("Blue"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct LetsGoButtonView: View {
    var title: String
    var destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color("LightOrange"))
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct TripButtonView: View {
    
    var time: Date
    var pickup: String
    var dropoff: String
    
    var body: some View {
            VStack {
                HStack {
                    Text(time, style: .time).bold()

                    Text("pickup")
                }
                .padding(5)
                
                HStack{
                    Text(pickup)
                    Text("->")
                    Text(dropoff)
                }
            }
                .padding()
                .frame(width: 350, height: 100)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Blue")))
    }
    
}


struct MatchingView_Previews: PreviewProvider {
    static var previews: some View {
        MatchingView(rides: Binding.constant(RideEvent.previewData))
    }
}
