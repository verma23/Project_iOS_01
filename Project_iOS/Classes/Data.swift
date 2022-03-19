//
//  Data.swift
//  Project_iOS
//
//  Created by Shivanshu Verma on 2022-03-12.
//

import UIKit

class Data: NSObject {
    var id : Int?
    var Fname: String?
    var Lname: String?
    var EmailAddress: String?
    var PhoneNumber: String?
    var newPass: String?
    var confirmPass: String?
    
    
    
    func initWithData(theRow i :Int, theFname n: String , theLname l: String, theEmail e : String, thePhone pn : String, theNpass p : String, theConfirmpass c : String    ){
    id = i
    Fname = n
       Lname = l
        EmailAddress = e
        PhoneNumber = pn
        newPass = p
        confirmPass = c
        
    }
}
