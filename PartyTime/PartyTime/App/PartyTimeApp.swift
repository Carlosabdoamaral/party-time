//
//  PartyTimeApp.swift
//  PartyTime
//
//  Created by Carlos Amaral on 11/02/22.
//

import SwiftUI

@main
struct PartyTimeApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                MapView()
                    .tabItem {
                        Image(systemName: "mappin")
                        Text("Map")
                    }
            }
        }
    }
}
