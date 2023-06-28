//
//  OfferRideView.swift
//  Dubr
//
//  Created by Philjae Chang on 4/6/23.
//

import SwiftUI

struct OfferRideView: View {
    
    @State var pickupTime: Date = Date()  // change this to let later
    @State var dropOffLoc: String = "Cocoa Cinnamon" // change this to let later
    @State var pickUpLoc: String = "Blue Light Apartment"
    @State var numRider: Int = 0
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Destination:")
                        .font(.title)
                        .foregroundColor(Color("Blue"))
                    Spacer()
                    Text(dropOffLoc)
                        .font(.title2)
                }
                .padding()

                
                HStack{
                    Text("PickUp Location:")
                        .font(.title)
                        .foregroundColor(Color("Blue"))
                    Spacer()
                }
                .padding()
                
                Button(action: {
                    
                }) {
                    Text(dropOffLoc)
                        .frame(minWidth: 0, maxWidth: 350)
                        .font(.system(size: 18))
                        .padding([.top, .bottom], 10)
                        .foregroundColor(Color("Blue"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )
                }
                
                HStack{
                    Text("Number of Passengers:")
                        .font(.title)
                        .foregroundColor(Color("Blue"))
                    Spacer()
                }
                .padding()
                
                Picker("Number of people", selection: $numRider) {
                    ForEach(1 ..< 5) {
                        if $0 == 1 {
                            Text("\($0) person")
                        } else {
                            Text("\($0) people")
                        }
                    }
                }
                .pickerStyle(.segmented)
                .padding([.leading, .trailing], 20)
                
                Spacer()
            }
            .navigationTitle("Offering a ride?")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("Blue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct OfferRideView_Previews: PreviewProvider {
    static var previews: some View {
        OfferRideView()
    }
}
