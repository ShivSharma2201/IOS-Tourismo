//
//  AttractionsDB.swift
//  pro5
//
//  
//

import Foundation
class AttractionsDB {
    static let shared = AttractionsDB()
    
    private init() {
        self.attractionsList.append(Attraction(id: 1, imageFileID: "canoe_three", imageFileIDTwo: "canoe", imageFileIDThree: "canoe_two", attractionName: "Sunset Canoe Tour of the Waterfront", price: 52.00, description: "On this tour you'll take a canoe trip to the waterfront of our city and watch the sun set over the city skyline.  Basic canoeing instructions provided at the start of the tour.  Canoe rental and life jackets are included in the ticket price.", rating: 4, contactNum: "555-555-5555"))
        self.attractionsList.append(Attraction(id: 2, imageFileID: "central_park_three", imageFileIDTwo: "central_park", imageFileIDThree: "central_park_two", attractionName: "Central Park", price: 102.00, description: "Central park is the most visited urban park in the United States.  Main attractions include the Ramble and Lake, Hallett Nature Sanctuary, and the Jacqueline Kennedy Onassis Reservoir.", rating: 3, contactNum: "333-333-3333"))
        self.attractionsList.append(Attraction(id: 3, imageFileID: "skyscraper3", imageFileIDTwo: "skyscraper", imageFileIDThree: "skyscraper2", attractionName: "Empire State Building", price: 30.00, description: "The Empire State Building is 102 stories.  It is the world's most famous office building.  The building has great sight seeing.", rating: 5, contactNum: "999-999-9999"))
        
    }
    
    var attractionsList = [Attraction]()
    
}
