//
//  TitleAndLoginScreen.swift
//  Dubr
//
//  Created by Samuel Rivera on 3/29/23.
//

import SwiftUI

struct TitleAndLoginScreen: View {
    @ObservedObject var userData: UserData
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var usernameJiggle: CGFloat = 0
    @State private var passwordJiggle: CGFloat = 0
    
    @State private var showLoginScreen = Passenger()
    @State private var showSignUpView = false
    
    
    var body: some View {
        if showLoginScreen.firstName != "NA"{
            TabContainer(user:showLoginScreen)
        }
        else if showSignUpView{
            SignUpPage(userData: userData)
        }else{
            NavigationView{
                ZStack{
                    LinearGradient(gradient: .init(colors: [Color("Blue"), Color("Orange")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("Dubr")
                            .font(.custom("Audiowide-Regular", size: 60))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(60)
                        Spacer()
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 100)
                            .scale(1.2)
                            .foregroundColor(.white)
                            .padding(.top, 270.0)
                            .padding(.leading, 10.0)
                        VStack{
                            Text("Login").foregroundColor(Color("LightOrange"))
                                .font(.largeTitle)
                                .padding()
                            VStack(alignment: .leading){
                                Text("NetID")
                                    .font(.subheadline)
                                    .foregroundColor(Color("LightOrange"))
                                    .multilineTextAlignment(.leading)
                                TextField("", text: $username)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color("LightOrange").opacity(0.3))
                                    .cornerRadius(10)
                                    .border(.red, width: CGFloat(wrongUsername))
                                    .offset(x: usernameJiggle)
                                    .autocapitalization(.none)
                                Text("Password")
                                    .font(.subheadline)
                                    .foregroundColor(Color("LightOrange"))
                                    .multilineTextAlignment(.leading)
                                SecureField("", text: $password)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color("LightOrange").opacity(0.3))
                                    .cornerRadius(10)
                                    .border(.red, width: CGFloat(wrongPassword))
                                    .offset(x: passwordJiggle)
                                    .autocapitalization(.none)
                            }
                            Button("Login"){
                                authenticateUser(username: username, password: password)
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color("LightOrange"))
                            .cornerRadius(10)
                            VStack{
                                HStack{
                                    Text("Don't have an account?")
                                        .foregroundColor(Color("LightOrange"))
                                    Button("Sign up") {
                                        showSignUpView = true
                                    }
                                    .foregroundColor(Color("LightOrange"))
                                    .bold()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func jiggle(_ jiggleAmount: Binding<CGFloat>) {
        withAnimation(.easeInOut(duration: 0.05)) {
            jiggleAmount.wrappedValue = 10
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeInOut(duration: 0.05)) {
                jiggleAmount.wrappedValue = -10
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation(.easeInOut(duration: 0.05)) {
                jiggleAmount.wrappedValue = 0
            }
        }
    }
    
    func authenticateUser(username: String, password: String) {
        if let user = userData.existingUsers.first(where: { $0.username == username.lowercased() }) {
            wrongUsername = 0
            if password == user.password {
                wrongPassword = 0
                showLoginScreen = user
            } else {
                wrongPassword = 2
                jiggle($passwordJiggle)
            }
        } else {
            wrongUsername = 2
            jiggle($usernameJiggle)
        }
    }
    
}

