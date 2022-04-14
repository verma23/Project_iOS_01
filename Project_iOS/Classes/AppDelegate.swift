//
//  AppDelegate.swift
//  Project_iOS
//
//  Created by Shivanshu Verma on 2022-03-02.
//


import UIKit
import CoreData
import SQLite3


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var databaseName : String? = "projDatabase.db"
    var databasePath : String?
    var userI : Int?
    var user_1 : String?
    var user_2 : String?
    
    var databaseName2 : String? = "IOSProject.db"
    var databasePath2 : String?
    
    var databaseName3 : String? = "imageData.db"
    var databasePath3 : String?
    
    
    
    var people : [Shivanshu_Data] = []
    
    var theatres : [String] = []
    var img : [imageData] = []
    var tickets : [TicketBook] = []      // By Jashan Goyal, this variable stores tickets in the array that we recieve from database IOSProject.db
    
    //var selectedQuestion : String = ""
    
    var selectedAnswer : String = ""
    
    var selectedTicketName : String = ""        // By Jashan Goyal, stores ticket Name and used in ticket and ticket detail view controller
    var selectedTicketDate: String = ""         // By Jashan Goyal, stores ticket Date and used in ticket and ticket detail view controller
    var selectedTicketTheatre : String = ""     // By Jashan Goyal, stores ticket Theatre and used in ticket and ticket detail view controller
    var selectedTicketQuantity: String = ""     // By Jashan Goyal, stores ticket Quantity and used in ticket and ticket detail view controller
    var selectedTicketSeats : String = ""       // By Jashan Goyal, stores ticket Seats and used in ticket and ticket detail view controller
    var selectedTicketType: String = ""         // By Jashan Goyal, stores ticket Type and used in ticket and ticket detail view controller
    var selectedTicketImage: String = ""        // By Jashan Goyal, stores ticket Image and used in ticket and ticket detail view controller
    var selectedEmail: String = ""              // By Jashan Goyal, stores ticket Email and used in ticket and ticket detail view controller
    var selectedMovie: String = ""  // By Jashan Goyal, stores the movie name
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let documentPaths  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDir = documentPaths[0]
        databasePath = documentDir.appending("/" + databaseName!)
        
        let documentPathss  = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirr = documentPathss[0]
        databasePath2 = documentDirr.appending("/" + databaseName2!)
        let DocPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = DocPath[0]
        databasePath3 = docDir.appending("/" + databaseName3!)
        
        UserDefaults.standard.removeObject(forKey: "movieName")
        UserDefaults.standard.removeObject(forKey: "seats")
        UserDefaults.standard.removeObject(forKey: "updatedseats")
        UserDefaults.standard.removeObject(forKey: "A1")
        UserDefaults.standard.removeObject(forKey: "A2")
        UserDefaults.standard.removeObject(forKey: "A3")
        UserDefaults.standard.removeObject(forKey: "A4")
        UserDefaults.standard.removeObject(forKey: "A5")
        UserDefaults.standard.removeObject(forKey: "B1")
        UserDefaults.standard.removeObject(forKey: "B2")
        UserDefaults.standard.removeObject(forKey: "B3")
        UserDefaults.standard.removeObject(forKey: "B4")
        UserDefaults.standard.removeObject(forKey: "B5")
        UserDefaults.standard.removeObject(forKey: "C1")
        UserDefaults.standard.removeObject(forKey: "C2")
        UserDefaults.standard.removeObject(forKey: "C3")
        UserDefaults.standard.removeObject(forKey: "C4")
        UserDefaults.standard.removeObject(forKey: "C5")
        UserDefaults.standard.removeObject(forKey: "D1")
        UserDefaults.standard.removeObject(forKey: "D2")
        UserDefaults.standard.removeObject(forKey: "D3")
        UserDefaults.standard.removeObject(forKey: "D4")
        UserDefaults.standard.removeObject(forKey: "D5")
    
        
        checkAndCreateDatabase()
        checkAndCreateDatabase2()
        checkAndCreateDatabase3()
        readFromDataBase()
    
        
        theatres = ["SilverCity Brampton", "Courtney Park Mississauga", "Fairview Mall Toronto", "Galaxy Guelph", "Empress Walk Toronto"]
        
        return true
    }
    

   
    func checkAndCreateDatabase(){
            var success = false
      
            let fileManager = FileManager.default
            
            success = fileManager.fileExists(atPath: databasePath!)
            
            if success{
                return
            }
        
            let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
            try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath! )
            return
            
            
        }
    
    func checkAndCreateDatabase2(){
            var success = false
      
            let fileManager = FileManager.default
            
            success = fileManager.fileExists(atPath: databasePath2!)
            print(databasePath2)
            if success{
                return
            }
        
            let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName2!)
            try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath2! )
            return
            
            
        }
    func checkAndCreateDatabase3()
    {
        var success = false
  
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasePath3!)
        
        if success{
            return
        }
    
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName3!)
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath3! )
        return
    }
    
    func insertIntoDatabase(person : Shivanshu_Data) -> Bool{
            var db : OpaquePointer? = nil
            var returnCode : Bool = true
            
            if sqlite3_open(self.databasePath, &db) == SQLITE_OK
            {
                
                var insertState : OpaquePointer? = nil
                var insetStateString : String = "insert into entries values(NULL, ?, ?, ?,? ,?,?)"
                
                if sqlite3_prepare_v2( db,insetStateString, -1, &insertState, nil) == SQLITE_OK
                {
                    let FnameStr = person.Fname as! NSString
                    let LnameStr = person.Lname as! NSString
                    let EmailStr = person.EmailAddress as! NSString
                    let PNumStr = person.PhoneNumber as! NSString
                    let NewPassStr = person.newPass as! NSString
                    let ConfirmStr = person.confirmPass as! NSString
                
                    
                    sqlite3_bind_text(insertState, 1, FnameStr.utf8String, -1, nil)
                    sqlite3_bind_text(insertState, 2, LnameStr.utf8String, -1, nil)
                    sqlite3_bind_text(insertState, 3, EmailStr.utf8String, -1, nil)
                    sqlite3_bind_text(insertState, 4, PNumStr.utf8String, -1, nil)
                    sqlite3_bind_text(insertState, 5,  NewPassStr.utf8String, -1, nil)
                    sqlite3_bind_text(insertState, 6, ConfirmStr.utf8String, -1, nil)
                    
                    if sqlite3_step(insertState) == SQLITE_DONE
                    {
                        let rowId = sqlite3_last_insert_rowid(db)
                        print("Succcessfull \(rowId)")
                    }
                    else
                    {
                        print("fail")
                        returnCode = false
                    }
                    
                    sqlite3_finalize(insertState)
                    
                }
                else
                {
                    print("insert failed")
                    returnCode = false
                }
                sqlite3_close(db)
            }
            else
            {
                print("Fail")
                returnCode = false
            }
            return returnCode
        }
    
    
    func insertImage(imageInfo: imageData) -> Bool
    {
        
        var db : OpaquePointer? = nil
        var returnCode : Bool = true
        
        if sqlite3_open(self.databasePath3, &db) == SQLITE_OK
        {
            
            var insertState : OpaquePointer? = nil
            var insetStateString : String = "insert into imageData values(NULL, ?)"
            
            if sqlite3_prepare_v2( db,insetStateString, -1, &insertState, nil) == SQLITE_OK
            {
                let UimageStr = imageInfo.imgD as! NSString
            
            
                
                sqlite3_bind_text(insertState, 1, UimageStr.utf8String, -1, nil)
              
                
                if sqlite3_step(insertState) == SQLITE_DONE
                {
                    let rowId = sqlite3_last_insert_rowid(db)
                    print("Succcessfull \(rowId)")
                }
                else
                {
                    print("fail")
                    returnCode = false
                }
                
                sqlite3_finalize(insertState)
                
            }
            else
            {
                print("insert failed")
                returnCode = false
            }
            sqlite3_close(db)
        }
        else
        {
            print("Fail")
            returnCode = false
        }
        return returnCode
        
        
    }
    
    func readForImage()
    {
        img.removeAll()
       var  db : OpaquePointer? = nil
        if sqlite3_open(self.databasePath3,  &db) == SQLITE_OK
        {
            print("Success")
            
            var queryState : OpaquePointer? = nil
            var queryStatementString : String = "select * from imageData"
            
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryState, nil) == SQLITE_OK {
                
                while sqlite3_step(queryState) == SQLITE_ROW
                {
                    let id: Int = Int(sqlite3_column_int(queryState, 0))
                    let cUserIamge = sqlite3_column_text(queryState, 1)
                    
                    
                    let userImg = String(cString: cUserIamge!)
                   
                    
                    
                    let info : imageData = imageData.init()
                    info.initWithData(theRow: id, TheimgD: userImg)
                    img.append(info)
                    print("Result")
                    print("\(id) | \(userImg)")
                    
                    
                    
                    
                    
                }
                sqlite3_finalize(queryState)
                
            }
            else
            {
                print("Select Statement Error")
            }
            sqlite3_close(db)
        }
        else{
            print ("unable to open Database")
        }
    }
        
    func readFromDataBase()
    {
        people.removeAll()
       var  db : OpaquePointer? = nil
        if sqlite3_open(self.databasePath,  &db) == SQLITE_OK
        {
            print("Success")
            
            var queryState : OpaquePointer? = nil
            var queryStatementString : String = "select * from entries"
            
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryState, nil) == SQLITE_OK {
                
                while sqlite3_step(queryState) == SQLITE_ROW
                {
                    let id: Int = Int(sqlite3_column_int(queryState, 0))
                    let cFname = sqlite3_column_text(queryState, 1)
                    let cLname = sqlite3_column_text(queryState, 2 )
                    let cEmailAddress = sqlite3_column_text(queryState, 3)
                    let cPhoneNumber = sqlite3_column_text(queryState, 4)
                    let cNewPass = sqlite3_column_text(queryState, 5)
                    let cConfirmPass = sqlite3_column_text(queryState, 6)
                    
                    let firstName = String(cString: cFname!)
                    let lastName = String(cString: cLname!)
                    let emailAddress = String(cString: cEmailAddress!)
                    let phoneNum = String(cString: cPhoneNumber!)
                    let newPass = String(cString: cNewPass!)
                    let confirmPass = String(cString: cConfirmPass!)
                    
                    
                    let data : Shivanshu_Data = Shivanshu_Data.init()
                    data.initWithData(theRow:  id, theFname: firstName, theLname: lastName, theEmail: emailAddress,thePhone: phoneNum,theNpass: newPass, theConfirmpass: confirmPass)
                    people.append(data)
                    print("Result")
                    print("\(id) | \(firstName) | \(emailAddress) ")
                    
                    
                    
                    
                    
                }
                sqlite3_finalize(queryState)
                
            }
            else
            {
                print("Select Statement Error")
            }
            sqlite3_close(db)
        }
        else{
            print ("unable to open Database")
        }
    }
    
    
    func VerifyLoginFromDatase(uEmail: String , uPass: String ) -> Bool
    {
        var  x : Bool = false
            people.removeAll()
           var  db : OpaquePointer? = nil
            if sqlite3_open(self.databasePath,  &db) == SQLITE_OK
            {
                print("Success")
                
                var queryState : OpaquePointer? = nil
                var queryStatementString : String = "select * from entries where Email = '\(uEmail)' and Confirm = '\(uPass)' "
                
                if sqlite3_prepare_v2(db, queryStatementString, -1, &queryState, nil) == SQLITE_OK {
                    
                    while sqlite3_step(queryState) == SQLITE_ROW
                    {
                        let id: Int = Int(sqlite3_column_int(queryState, 0))
                        let cFname = sqlite3_column_text(queryState, 1)
                        let cLname = sqlite3_column_text(queryState, 2 )
                        let cEmailAddress = sqlite3_column_text(queryState, 3)
                        let cPhoneNumber = sqlite3_column_text(queryState, 4)
                        let cNewPass = sqlite3_column_text(queryState, 5)
                        let cConfirmPass = sqlite3_column_text(queryState, 6)
                        
                        let firstName = String(cString: cFname!)
                        let lastName = String(cString: cLname!)
                        let emailAddress = String(cString: cEmailAddress!)
                        let phoneNum = String(cString: cPhoneNumber!)
                        let newPass = String(cString: cNewPass!)
                        let confirmPass = String(cString: cConfirmPass!)
                        userI = id
                        
                        
                        let data : Shivanshu_Data = Shivanshu_Data.init()
                        data.initWithData(theRow:  id, theFname: firstName, theLname: lastName, theEmail: emailAddress,thePhone: phoneNum,theNpass: newPass, theConfirmpass: confirmPass)
                        people.append(data)
                        print("Result")
                        print("\(id) | \(firstName) | \(emailAddress) ")
                    
                        x = true
                        
                    }
                    sqlite3_finalize(queryState)
                    
                }
                else
                {
                    print("Select Statement Error")
                    x = false
                }
                sqlite3_close(db)
            }
            else{
                print ("unable to open Database")
                x = false
            }
        return x
        
        
    }
    
    func confirmDetails(userInfo: Int) -> Bool
    {
        var  x : Bool = false
            people.removeAll()
           var  db : OpaquePointer? = nil
            if sqlite3_open(self.databasePath,  &db) == SQLITE_OK
            {
                print("Success")
                
                var queryState : OpaquePointer? = nil
                var queryStatementString : String = "select * from entries where id = \(userInfo) "
                
                if sqlite3_prepare_v2(db, queryStatementString, -1, &queryState, nil) == SQLITE_OK {
                    
                    while sqlite3_step(queryState) == SQLITE_ROW
                    {
                        let id: Int = Int(sqlite3_column_int(queryState, 0))
                        let cFname = sqlite3_column_text(queryState, 1)
                        let cLname = sqlite3_column_text(queryState, 2 )
                        let cEmailAddress = sqlite3_column_text(queryState, 3)
                        let cPhoneNumber = sqlite3_column_text(queryState, 4)
                        let cNewPass = sqlite3_column_text(queryState, 5)
                        let cConfirmPass = sqlite3_column_text(queryState, 6)
                        
                        let firstName = String(cString: cFname!)
                        let lastName = String(cString: cLname!)
                        let emailAddress = String(cString: cEmailAddress!)
                        let phoneNum = String(cString: cPhoneNumber!)
                        let newPass = String(cString: cNewPass!)
                        let confirmPass = String(cString: cConfirmPass!)
                        user_1 = firstName
                        user_2 = phoneNum
                        
                        
                        let data : Shivanshu_Data = Shivanshu_Data.init()
                        data.initWithData(theRow:  id, theFname: firstName, theLname: lastName, theEmail: emailAddress,thePhone: phoneNum,theNpass: newPass, theConfirmpass: confirmPass)
                        
                        print("Result")
                        print("\(id) | \(firstName) | \(emailAddress) ")
                    
                        x = true
                        
                    }
                    sqlite3_finalize(queryState)
                    
                }
                else
                {
                    print("Select Statement Error")
                    x = false
                }
                sqlite3_close(db)
            }
            else{
                print ("unable to open Database")
                x = false
            }
        return x
        
        
    }
 
    // By Jashan Goyal
    // This below method retrieves data from the database 'ticketBookings' and it is used by the app.
    func readFromDataBaseBooking()
    {
        tickets.removeAll()
       var  db1 : OpaquePointer? = nil
        if sqlite3_open(self.databasePath2,  &db1) == SQLITE_OK
        {
            print("Success")
            
            var queryState1 : OpaquePointer? = nil
            let queryStatementString1 : String = "select * from ticketBookings where email = '\(selectedEmail)'"
            
            if sqlite3_prepare_v2(db1, queryStatementString1, -1, &queryState1, nil) == SQLITE_OK {
                
                while sqlite3_step(queryState1) == SQLITE_ROW
                {
                    let id: Int = Int(sqlite3_column_int(queryState1, 0))
                    let cMovieName = sqlite3_column_text(queryState1, 1)
                    let cSeats = sqlite3_column_text(queryState1, 2 )
                    let cDateTime = sqlite3_column_text(queryState1, 3)
                    let cTicketType = sqlite3_column_text(queryState1, 4)
                    let cTheatre = sqlite3_column_text(queryState1, 5)
                    let cQuantity = sqlite3_column_text(queryState1, 6)
                    let cImage = sqlite3_column_text(queryState1, 7)
                    let cEmail = sqlite3_column_text(queryState1, 8)
                    
                    let movieName = String(cString: cMovieName!)
                    let seats = String(cString: cSeats!)
                    let dateTime = String(cString: cDateTime!)
                    let ticketType = String(cString: cTicketType!)
                    let theatre = String(cString: cTheatre!)
                    let quantity = String(cString: cQuantity!)
                    let image = String(cString: cImage!)
                    let email = String(cString: cEmail!)
                    
                    let ticketBook : TicketBook = TicketBook.init()
                    ticketBook.initWithData(theRow: id, theMoviename: movieName, theSeats: seats, theDateTume: dateTime, theTicketType: ticketType, theTheatre: theatre, theQuantity: quantity, theImage: image, theEmail: email)
                    tickets.append(ticketBook)
                    print("Result")
                    print("\(id) | \(movieName) | \(ticketType) | \(image) |")
                }
                
                sqlite3_finalize(queryState1)
            }
            else
            {
                print("Select Statement Error in else")
            }
            sqlite3_close(db1)
        }
        else{
            print ("unable to open Database")
        }
    }
    
    // MARK: UISceneSession Lifecycle
    
    func insertIntoDatabaseBookings(ticket : TicketBook) -> Bool {
        var db : OpaquePointer? = nil
        var returnCode : Bool = true
        
        if sqlite3_open(self.databasePath2,  &db) == SQLITE_OK{
            var insertStatement : OpaquePointer? = nil
            let insertStatementString : String = "insert into ticketBookings values(NULL, ?, ?, ?, ?, ?, ?, ?, ?)"
            
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK{
                let movienamStr = ticket.moviename! as NSString
                let seatsStr = ticket.seats! as NSString
                let dateTimeStr = ticket.dateTime! as NSString
                let ticketTypeStr = ticket.ticketType! as NSString
                let theatreStr = ticket.theatre! as NSString
                let quantityStr = ticket.quantity! as NSString
                let imageStr = ticket.image! as NSString
                let emailStr = ticket.email! as NSString
                
                sqlite3_bind_text(insertStatement, 1, movienamStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 2, seatsStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, dateTimeStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, ticketTypeStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, theatreStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, quantityStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, imageStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 8, emailStr.utf8String, -1, nil)

                
                if sqlite3_step(insertStatement) == SQLITE_DONE{
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row \(rowID)")
                    
                }
                else{
                    print("Could not insert row")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            }
            else{
                print("Insert not working")
                returnCode = false
            }
            sqlite3_close(db)
        }
        else{
            print("unable to open database")
            returnCode = false
        }
        
        return returnCode
    }


    // MARK: UIScen

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

