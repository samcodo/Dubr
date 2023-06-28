//
//  WelcomeView.swift
//  Dubr
//
//  Created by Samuel Rivera on 4/23/23.
//

import SwiftUI

struct WelcomeView: View {
    @State var user: Passenger
    
    @State private var imageUrl: String = ""
    @State private var showTabContainer = false
    
    var body: some View {
        if showTabContainer{
            TabContainer(user: user)
        }else{
            VStack{
                ZStack{
                    LinearGradient(gradient: .init(colors: [Color("Blue"), Color("Orange")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Welcome, \n\(user.firstName)")
                            .font(.system(size: 50))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        Spacer()
                    }
                    VStack{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 250)
                            .foregroundColor(.white)
                            .padding(.top, 150)

                        Button(action: {
                            // action for setting profile photo using imageUrl
                        }) {
                            Text("Set Profile Photo")
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color("LightOrange"))
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        Button(action: {
                            showTabContainer = true
                        }) {
                            Text("Skip")
                                .foregroundColor(Color("LightOrange"))
                                .frame(width: 200, height: 50)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(user: Passenger())
    }
}
