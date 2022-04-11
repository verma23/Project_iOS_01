//
//  BookingViewController.swift
//  Project_iOS
//
//  Created by  on 2022-03-25.
//

import UIKit

class BookingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    var selection: String!
    var seatsLabel: String!
    var updateSeat: String!
    
    
    @IBOutlet var slQuantity : UISlider!
    @IBOutlet var lbQuantity : UILabel!
    @IBOutlet var lbdatetime : UILabel!
    @IBOutlet var dpdatetime : UIDatePicker!
    @IBOutlet var lbTheatre : UILabel!
    @IBOutlet var sgtickettype : UISegmentedControl!
    @IBOutlet var lbtickettype : UILabel!
    @IBOutlet var lbseats : UILabel!
    @IBOutlet var lbmovie : UILabel!
    
    @IBOutlet var viewReciept: UIButton!
    
    
    
    
    @IBAction func SaveReciept(sender: UIButton)
    {
        let fileName = "paymentReciept"
        let DocumentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = DocumentURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        print("File Path: \(fileURL.path)")
        let quantity: Int? = Int(lbQuantity.text!)
        let priceRegular = 14
        let priceiMax = 20
        
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
            } catch let error as NSError {
                print("Failed to write to file")
                print(error)
            }
        }
        
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
            } catch let error as NSError {
                print("Failed to write to file")
                print(error)
            }
        }
        
        
        
        
                   
                    
    }
    
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mainDelegate.theatres.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return mainDelegate.people[row].name
        return mainDelegate.theatres[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let alertcontroller = UIAlertController(title: mainDelegate.people[row].email, message: mainDelegate.people[row].food, preferredStyle: .alert)
//
//        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//        alertcontroller.addAction(cancelAction)
//        present(alertcontroller, animated: true)
        
        //lbcheck.text = mainDelegate.people[row].name
        
        lbTheatre.text = mainDelegate.theatres[row]
        
    }
    
    @IBAction func sliderValueChanged(sender : UISlider)
    {
        updateQuantityLabel()
        
    }
    
    func updateQuantityLabel(){
        let quantity = slQuantity.value;
        let strQuantity = String(format: "%.f", quantity)
        lbQuantity.text = strQuantity
       
    }
    
    func updateDate(){
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"
        lbdatetime.text = dateFormatter.string(from: dpdatetime.date)
    }
    
    @IBAction func datePickerValueChanged(sender:UIDatePicker){
        updateDate()
    }
    
    @IBAction func segmentDidChange(_ sender : Any)
    {
        updateTicketType()
    }
    
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
    
    @IBAction func addTickets(sender:Any){
        
        let ticket : TicketBook = TicketBook.init()
        ticket.initWithData(theRow: 0, theMoviename: lbmovie.text!, theSeats: lbmovie.text!, theDateTume: lbdatetime.text!, theTicketType: lbtickettype.text!, theTheatre: lbTheatre.text!, theQuantity: lbQuantity.text!)

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
    
    

    
    @IBAction func saveMovieName(sender: UIButton) {
            let defaults = UserDefaults.standard
            defaults.set(lbmovie.text, forKey: "movieName")
            defaults.synchronize()
    }
    
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
