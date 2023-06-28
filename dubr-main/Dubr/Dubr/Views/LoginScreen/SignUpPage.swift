//
//  SignUpPage.swift
//  Dubr
//
//  Created by Samuel Rivera on 4/17/23.
//

import SwiftUI

struct SignUpPage: View {
    @ObservedObject var userData: UserData
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var invalidEmail = false
    @State private var invalidPasswordMatch = false
    @State private var missingField = false
    
    @State private var emailJiggle: CGFloat = 0
    @State private var firstNameJiggle: CGFloat = 0
    @State private var lastNameJiggle: CGFloat = 0
    @State private var passwordJiggle: CGFloat = 0
    @State private var confirmPasswordJiggle: CGFloat = 0
    
    @State private var showWelcomeView = Passenger()
    
    private func isPasswordValid() -> Bool {
        return password == confirmPassword
    }
    
    private func isEmailValid() -> Bool {
        return email.hasSuffix("@duke.edu")
    }
    
    private func areFieldsFilled() -> Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
    
    private func createPassenger() -> Passenger {
        let username = email.split(separator: "@").first.map(String.init)?.lowercased() ?? "NA"
        return Passenger(firstName: firstName, lastName: lastName, netIdEmail: email, username: username, password: password)
    }
    
    private func onSubmit() {
        missingField = !areFieldsFilled()
        invalidEmail = !isEmailValid()
        invalidPasswordMatch = !isPasswordValid()
        
        if missingField {
            if firstName.isEmpty {
                jiggle($firstNameJiggle)
            }
            if lastName.isEmpty {
                jiggle($lastNameJiggle)
            }
            if email.isEmpty {
                jiggle($emailJiggle)
            }
            if password.isEmpty {
                jiggle($passwordJiggle)
            }
            if confirmPassword.isEmpty {
                jiggle($confirmPasswordJiggle)
            }
        }
        
        if invalidEmail{
            jiggle($emailJiggle)
        }

        guard !missingField, !invalidEmail, !invalidPasswordMatch else {
            return
        }

        let passenger = createPassenger()
        userData.existingUsers.append(passenger)
        showWelcomeView = passenger
    }
    
    var body: some View {
        if showWelcomeView.firstName != "NA"{
            WelcomeView(user: showWelcomeView)
        }else{
            ZStack{
                LinearGradient(gradient: .init(colors: [Color("Blue"), Color("Orange")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                ZStack{
                    RoundedRectangle(cornerRadius: 100)
                        .scale(1.4)
                        .foregroundColor(.white)
                        .padding(.top, 220.0)
                        .padding(.leading, 10.0)
                    VStack {
                        Text("Sign Up")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                        Spacer()
                        VStack{
                            TextField("First Name", text: $firstName)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color("LightOrange").opacity(0.3))
                                .cornerRadius(10)
                                .border(firstName.isEmpty && missingField ? Color.red : Color.clear, width: firstName.isEmpty && missingField ? 2 : 0)
                                .padding(.bottom, 40)
                                .offset(x: firstNameJiggle)
                            TextField("Last Name", text: $lastName)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color("LightOrange").opacity(0.3))
                                .cornerRadius(10)
                                .border(lastName.isEmpty && missingField ? Color.red : Color.clear, width: lastName.isEmpty && missingField ? 2 : 0)
                                .padding(.bottom, 40)
                                .offset(x: lastNameJiggle)
                            TextField("NetID Email", text: $email)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color("LightOrange").opacity(0.3))
                                .cornerRadius(10)
                                .border(invalidEmail || (email.isEmpty && missingField) ? Color.red : Color.clear, width: invalidEmail || (email.isEmpty && missingField) ? 2 : 0)
                                .padding(.bottom, 40)
                                .offset(x: emailJiggle)
                                .autocapitalization(.none)
                            TextField("Password", text: $password)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color("LightOrange").opacity(0.3))
                                .cornerRadius(10)
                                .border(password.isEmpty && missingField ? Color.red : Color.clear, width: password.isEmpty && missingField ? 2 : 0)
                                .padding(.bottom, 40)
                                .offset(x: passwordJiggle)
                                .autocapitalization(.none)
                            TextField("Confirm Password", text: $confirmPassword)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color("LightOrange").opacity(0.3))
                                .cornerRadius(10)
                                .border(confirmPassword.isEmpty && missingField ? Color.red : Color.clear, width: confirmPassword.isEmpty && missingField ? 2 : 0)
                                .padding(.bottom, 40)
                                .offset(x: confirmPasswordJiggle)
                                .autocapitalization(.none)
                            Button(action: onSubmit) {
                                Text("Sign Up")
                                    .foregroundColor(.white)
                                    .frame(width: 300, height: 50)
                                    .background(Color("LightOrange"))
                                    .cornerRadius(10)
                            }
                            .padding()
                        }
                    }
                    .padding()
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
}
