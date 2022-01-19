//
//  Ticket.swift
//  pro5
//
//  
//

import Foundation
class Ticket {
    //var id:Int
    var curattraction:Attraction
    var date:Date
    init(curattraction:Attraction,date:Date){
        self.curattraction=curattraction
        self.date=date
    }
    
}
