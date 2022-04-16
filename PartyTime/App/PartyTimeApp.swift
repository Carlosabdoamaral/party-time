//
//  PartyTimeApp.swift
//  PartyTime
//
//  Created by Carlos Amaral on 11/02/22.
//

import SwiftUI

@main
struct PartyTimeApp: App {
    
    @AppStorage("isLogged") var isLogged : Bool = false
    @Environment(\.managedObjectContext) var db

    var body: some Scene {
        WindowGroup {
            
            if isLogged {
                TabView {
                    MapView()
                    .tabItem {
                        Image(systemName: "mappin")
                        Text("Mapa")
                    }
                    
                    UserProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Perfil")
                    }
                }
            } else {
                AuthView()
            }
            
        }
    }
}
