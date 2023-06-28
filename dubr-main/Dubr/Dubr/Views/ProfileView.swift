//
//  MyProfile.swift
//  Dubr
//
//  Created by Sydney Ballard on 4/12/23.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @State var user: Passenger
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("ProfileImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        
                }
                HStack {
                    Text("Welcome to Dubr!")
                        .padding(.top)
                        .foregroundColor(Color("Blue"))
                        .font(.title)
                }
                .padding(.bottom, 30)
                
                Spacer()
                
                VStack {
                    HStack {
                        MenuButtonView(title: "My Scheduled Rides", destination: AnyView(ScheduledRides()))
                    }
                    
                    HStack {
                        MenuButtonView(title: "My Places", destination: AnyView(MyPlacesView()))
                    }
                    
                    HStack {
                        MenuButtonView(title: "Past Trips", destination: AnyView(PastTripView()))
                    }
                
                }
                Spacer()
                
            }
            .padding()
            .navigationTitle("\(user.firstName) \(user.lastName)")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color("Blue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        
    }
    
}


