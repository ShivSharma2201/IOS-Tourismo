//
//  Attraction.swift
//  pro5
//
// 
//

import Foundation
struct Attraction {
    var id:Int
    var imageFileID:String
    var imageFileIDTwo:String
    var imageFileIDThree:String
    var attractionName:String
    var price:Double
    var description:String
    var rating:Int
    var contactNum:String
    var booked:Bool=false
    var favd:Bool=false

    
    init() {
        self.id = 1
        self.imageFileID = "unknown_photo"
        self.imageFileIDTwo = "unknown_photo"
        self.imageFileIDThree = "unknown_photo"
        self.attractionName = "Not Available"
        self.price = 0.0
        self.description = "Not Available"
        self.rating = 0
        self.contactNum = "Not Available"
    }
    
    init(id: Int, imageFileID: String, imageFileIDTwo: String, imageFileIDThree: String,attractionName: String, price: Double, description: String, rating: Int, contactNum: String) {
        self.id = id
        self.imageFileID = imageFileID
        self.imageFileIDTwo = imageFileIDTwo
        self.imageFileIDThree = imageFileIDThree
        self.attractionName = attractionName
        self.price = price
        self.description = description
        self.rating = rating
        self.contactNum = contactNum
    }
    
}
