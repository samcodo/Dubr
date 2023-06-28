//
//  LoggedIn.swift
//  Dubr
//
//  Created by Samuel Rivera on 4/17/23.
//

import SwiftUI

struct LoggedIn: View {
    @State var username: String
    
    var body: some View {
        Text("You are logged in @\(username)")
    }
}

struct LoggedIn_Previews: PreviewProvider {
    static var previews: some View {
        LoggedIn(username: "dog")
    }
}
