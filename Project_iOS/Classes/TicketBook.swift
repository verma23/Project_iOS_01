//
//  TicketBook.swift
//  Project_iOS
//
//  Created by Anee Patel  on 2022-03-28.
// This class has all the fields for booking the tickets
//

import UIKit

class TicketBook: NSObject {

   
        var id : Int? // Unique id of the ticket
        var moviename : String? // Movie name selected by the user
        var seats : String? // Seats selected by the user
        var dateTime: String? // Date and Time selected by the user
        var ticketType: String? // Ticket type selected by the user
        var theatre: String? // Theatre selected by the user
        var quantity: String? // Quantity selected by the user
        var image: String?
        var email: String?
    
    // A constructor initwithdata for ticketbook class
    func initWithData(theRow i :Int, theMoviename m: String, theSeats s: String, theDateTume dt: String , theTicketType tt: String, theTheatre t: String, theQuantity q : String, theImage im: String, theEmail e: String){
        id = i
        moviename = m
        seats = s
        dateTime = dt
        ticketType = tt
        theatre = t
        quantity = q
        image = im
        email = e
        }
    
}
