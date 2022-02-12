//
//  UserController.swift
//  PartyTime
//
//  Created by Carlos Amaral on 12/02/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "UserData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data error while loading \(error.localizedDescription)")
            }
        }
    }
}
