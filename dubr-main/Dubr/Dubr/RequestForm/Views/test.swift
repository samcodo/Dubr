//
//  test.swift
//  Dubr
//
//  Created by Philjae Chang on 4/22/23.
//

import SwiftUI

struct test: View {
    @State var locations: [Location] = Location.previewData
    @Binding var tabSelection: Int
    var body: some View {
        RequestRideView(rider: Binding.constant("driverEmail"), destination: $locations[0], tabSelection: $tabSelection)
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test(tabSelection: Binding.constant(3))
    }
}
