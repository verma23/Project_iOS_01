//
//  imageData.swift
//  Project_iOS
//
//  Created by SHivanshu on 2022-04-07.
//

import UIKit

class imageData: NSObject {
    var id : Int?
    var imgD: String?
    
    func initWithData(theRow i :Int, TheimgD img : String  ){
    id = i
   imgD = img
        
    }
    

}
