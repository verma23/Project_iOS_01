//
//  BookingViewController.swift
//  Project_iOS
//
//  Created by  on 2022-03-25.
//

import UIKit

class BookingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    var selection: String!

    @IBOutlet var slQuantity : UISlider!
    @IBOutlet var lbQuantity : UILabel!
    @IBOutlet var lbdatetime : UILabel!
    @IBOutlet var dpdatetime : UIDatePicker!
    @IBOutlet var lbTheatre : UILabel!
    @IBOutlet var sgtickettype : UISegmentedControl!
    @IBOutlet var lbtickettype : UILabel!
    @IBOutlet var lbseats : UILabel!
    @IBOutlet var lbmovie : UILabel!
        
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbmovie.text = selection
        
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
