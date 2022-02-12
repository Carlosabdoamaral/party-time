//
//  UserModel.swift
//  PartyTime
//
//  Created by Carlos Amaral on 12/02/22.
//

import Foundation

struct UserModel : Codable, Identifiable {
    var id : UUID = UUID()
    var username : String = ""
    var name : String = ""
    var email : String = ""
    var phone : String = ""
    var localization : Bool = false
    var publicProfile : Bool = true
    var deleteAccount : Bool = false
    var password : String = ""
}
