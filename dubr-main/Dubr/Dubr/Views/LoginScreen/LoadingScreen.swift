//
//  LoadingScreen.swift
//  Dubr
//
//  Created by Samuel Rivera on 3/29/23.
//

import SwiftUI


struct LoadingScreen: View {
    @State private var isActive = false
    @State private var opacity = 0.5
    @ObservedObject var userData: UserData
    
    var body: some View {
        if isActive{
            TitleAndLoginScreen(userData: userData)
        }else{
            VStack{
                ZStack{
                    LinearGradient(gradient: .init(colors: [Color("Blue"), Color("Orange")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                    Text("Dubr")
                        .font(.custom("Audiowide-Regular", size: 60))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                    self.isActive = true
                }
            }
        }
    }
}

