//
//  User.swift
//  pro5
//
//  
//

import Foundation
class User {
    var id:Int=0
    var email:String
    var password:String
    var ticketList=[Ticket]()
    var favList=[Attraction]()
    init() {
        self.email = "Not Available"
        self.password = "Not Available"
    }
    
    init(email: String, password: String,id:Int) {
        self.email = email
        self.password = password
        self.id=id
    }
}
