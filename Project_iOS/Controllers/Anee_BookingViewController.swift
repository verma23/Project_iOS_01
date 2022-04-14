//
//  BookingViewController.swift
//  Project_iOS
//
//  Created by Anee Patel on 2022-03-25.
// This is the view controller for booking the tickets

import UIKit

class Anee_BookingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    var selection: String! // String variable for movie name
    var seatsLabel: String! // Karn Bhavsar - String variable for seats
    var updateSeat: String! // Karn Bhavsar - String variable for updated seats
    var selection2: String!
    
    @IBOutlet var slQuantity : UISlider! // Slider for tickets quantity
    @IBOutlet var lbQuantity : UILabel! // Label to store the slider value of quantity
    @IBOutlet var lbdatetime : UILabel! // Label to store the date picker value
    @IBOutlet var dpdatetime : UIDatePicker! // Date picker for movie show date and time
    @IBOutlet var lbTheatre : UILabel! // Label to store the picker view value of theatre
    @IBOutlet var sgtickettype : UISegmentedControl! // Segmented control for ticket type
    @IBOutlet var lbtickettype : UILabel! // Label for storing the segmented control value
    @IBOutlet var lbseats : UILabel! // Karn Bhavsar - Label to store selected seats
    @IBOutlet var lbmovie : UILabel! // Label to store movie name
    
    @IBOutlet var viewReciept: UIButton! // Button to view your reciept
    
    
    
    // A function to save receipt to a text file
    @IBAction func SaveReciept(sender: UIButton)
    {
        
        let fileName = "paymentReciept"
        let DocumentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(fileURL.path)")
        let quantity: Int? = Int(lbQuantity.text!)
        let priceRegular = 14
        let priceiMax = 20
        
        // If the ticket type is regular
        if lbtickettype.text == "Regular"
        {
           let txt = """
                    Movie Name: \(lbmovie.text!)
                    Seats: \(lbseats.text!)
                    Date & Time: \(lbdatetime.text!)
                    Ticket Type: \(lbtickettype.text!)
                    Theater: \(lbTheatre.text!)
                    Quantity: \(lbQuantity.text!)
                    Price: $\(quantity! * priceRegular)
                """
            
            do {
                try txt.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                
                var alertbox = UIAlertController(title: "Receipt", message: "To view saved receipt, Open terminal and cd to the simulator's document directory path that is printed in console and then execute open paymentReceipt \n\n \(txt)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertbox.addAction(okAction)
                present(alertbox, animated: true)
                
            } catch let error as NSError {
                print("Failed to write to file")
                print(error)
            }
        }
        // If the ticket type is Imax
        if lbtickettype.text == "iMax"
        {
           let txt = """
                    Movie Name: \(lbmovie.text!)
                    Seats: \(lbseats.text!)
                    Date & Time: \(lbdatetime.text!)
                    Ticket Type: \(lbtickettype.text!)
                    Theater: \(lbTheatre.text!)
                    Quantity: \(lbQuantity.text!)
                    Price: $\(quantity! * priceiMax)
                """
            
            do {
                try txt.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                
                var alertbox = UIAlertController(title: "Receipt", message: "To view saved receipt, Open terminal and cd to the simulator's document directory path that is printed in console and then execute open paymentReceipt \n\n \(txt)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertbox.addAction(okAction)
                present(alertbox, animated: true)
                
            } catch let error as NSError {
                print("Failed to write to file")
                print(error)
            }
        }
        
        
        
        
                   
        
    }
    
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // A function to display all the theatres in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mainDelegate.theatres.count
    }
    
    // A fucntion to return number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // A function to return the title - theatre name
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return mainDelegate.theatres[row]
    }
    
    // An event handler - updates the label with the new theatre name
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        lbTheatre.text = mainDelegate.theatres[row]
        
    }
    
    // An event handler - Updates the quantity label
    @IBAction func sliderValueChanged(sender : UISlider)
    {
        updateQuantityLabel()
        
    }
    
    // A function to update the quantity label
    func updateQuantityLabel(){
        let quantity = slQuantity.value;
        let strQuantity = String(format: "%.f", quantity)
        lbQuantity.text = strQuantity
       
    }
    
    // A function to update the date and time label
    func updateDate(){
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"
        lbdatetime.text = dateFormatter.string(from: dpdatetime.date)
    }
    
    // An event handler - when the date picker value is changed
    @IBAction func datePickerValueChanged(sender:UIDatePicker){
        updateDate()
    }
    
    // An event handler - when the segmented control value is changed
    @IBAction func segmentDidChange(_ sender : Any)
    {
        updateTicketType()
    }
    
    // A function to update the label of ticket type
    func updateTicketType()
    {
        let tickettype = sgtickettype.selectedSegmentIndex;
    
        if(tickettype == 0)
        {
            lbtickettype.text = "Regular"
        }
        
        else
        {
            lbtickettype.text = "iMax"
        }
    
    }
    
    // An event handler - add tickets to the database
    @IBAction func addTickets(sender:Any){
        
        let ticket : TicketBook = TicketBook.init()
        ticket.initWithData(theRow: 0, theMoviename: lbmovie.text!, theSeats: lbseats.text!, theDateTume: lbdatetime.text!, theTicketType: lbtickettype.text!, theTheatre: lbTheatre.text!, theQuantity: lbQuantity.text!,  theImage: mainDelegate.selectedMovie, theEmail: mainDelegate.selectedEmail)

        let mDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let returnCode = mDelegate.insertIntoDatabaseBookings(ticket: ticket)
        
        var returnMSG : String = "Ticket booked"
        
        if returnCode == false{
            returnMSG = "Ticket booking failed"
            
        }
        
        let alertcntroller = UIAlertController(title: "SQLite add", message: returnMSG, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertcntroller.addAction(cancelAction)
        present(alertcntroller, animated: true)
    }
    
    // Karn Bhavsar - An event handler - for storing the user defaults for movie name
    @IBAction func saveMovieName(sender: UIButton) {
            let defaults = UserDefaults.standard
            defaults.set(lbmovie.text, forKey: "movieName")
            defaults.synchronize()
    }
    
    // Karn Bhavsar - An event handler - removing movie name user defaults when Movie button is clicked from nav bar
    @IBAction func removeMovieName(sender: UIButton){
        UserDefaults.standard.removeObject(forKey: "movieName")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbmovie.text = selection
        lbseats.text = seatsLabel
        
        
        let defaults = UserDefaults.standard
        
        if let movieName = defaults.object(forKey: "movieName") as? String
        {
           lbmovie.text = movieName
        }
        print(mainDelegate.selectedMovie)

        updateQuantityLabel()

        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
