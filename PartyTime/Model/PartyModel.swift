//
//  PartyModel.swift
//  PartyTime
//
//  Created by Carlos Amaral on 15/04/22.
//

import Foundation

class PartyModel : Identifiable, Codable {
    var id = UUID()
    var name : String
    var number : String
    var organizador : String
    var spaces : Int
    var date : Date
    var place : String
    var distance : Double
    var food : [String]
    var drink : [String]
}
