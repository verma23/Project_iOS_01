//
//  Karn_SeatsSeclectionViewController.swift
//  Project_iOS
//
//  Created by Karn Bhavsar  on 2022-04-10.
// This is the view controller for selecting the seats

import UIKit

class Karn_SeatsSeclectionViewController: UIViewController {

    var seatsLabel: String! // String variable for seats label
    
    
    // Variable for checking the seats if they are selected or not
    // Assigning the value as false - making the default state of seats as unselected seats
    var isActiveA1:Bool = false
    var isActiveA2:Bool = false
    var isActiveA3:Bool = false
    var isActiveA4:Bool = false
    var isActiveA5:Bool = false
    var isActiveB1:Bool = false
    var isActiveB2:Bool = false
    var isActiveB3:Bool = false
    var isActiveB4:Bool = false
    var isActiveB5:Bool = false
    var isActiveC1:Bool = false
    var isActiveC2:Bool = false
    var isActiveC3:Bool = false
    var isActiveC4:Bool = false
    var isActiveC5:Bool = false
    var isActiveD1:Bool = false
    var isActiveD2:Bool = false
    var isActiveD3:Bool = false
    var isActiveD4:Bool = false
    var isActiveD5:Bool = false
    
    // Declaring the buttonts for each seats
    @IBOutlet weak var A1: UIButton!
    @IBOutlet weak var A2: UIButton!
    @IBOutlet weak var A3: UIButton!
    @IBOutlet weak var A4: UIButton!
    @IBOutlet weak var A5: UIButton!
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var C1: UIButton!
    @IBOutlet weak var C2: UIButton!
    @IBOutlet weak var C3: UIButton!
    @IBOutlet weak var C4: UIButton!
    @IBOutlet weak var C5: UIButton!
    @IBOutlet weak var D1: UIButton!
    @IBOutlet weak var D2: UIButton!
    @IBOutlet weak var D3: UIButton!
    @IBOutlet weak var D4: UIButton!
    @IBOutlet weak var D5: UIButton!
    // Declaring a button for updating the seats
    @IBOutlet weak var update: UIButton!
    
    // Declaring the labels for all the seats
    @IBOutlet weak var seatsA1: UILabel!
    @IBOutlet weak var seatsA2: UILabel!
    @IBOutlet weak var seatsA3: UILabel!
    @IBOutlet weak var seatsA4: UILabel!
    @IBOutlet weak var seatsA5: UILabel!
    @IBOutlet weak var seatsB1: UILabel!
    @IBOutlet weak var seatsB2: UILabel!
    @IBOutlet weak var seatsB3: UILabel!
    @IBOutlet weak var seatsB4: UILabel!
    @IBOutlet weak var seatsB5: UILabel!
    @IBOutlet weak var seatsC1: UILabel!
    @IBOutlet weak var seatsC2: UILabel!
    @IBOutlet weak var seatsC3: UILabel!
    @IBOutlet weak var seatsC4: UILabel!
    @IBOutlet weak var seatsC5: UILabel!
    @IBOutlet weak var seatsD1: UILabel!
    @IBOutlet weak var seatsD2: UILabel!
    @IBOutlet weak var seatsD3: UILabel!
    @IBOutlet weak var seatsD4: UILabel!
    @IBOutlet weak var seatsD5: UILabel!
    
    
    @IBOutlet weak var seatsAppend: UILabel! // Label to store all the selected seats
    @IBOutlet weak var updatedSeats: UILabel! // Label to store all the updated seats
    
    // An event handler to update the seats label with the selected seats
    @IBAction func allSeats(sender: UIButton) {
        seatsAppend.text = "\(seatsA1.text!) \(seatsA2.text!) \(seatsA3.text!) \(seatsA4.text!) \(seatsA5.text!)" +
                           "\(seatsB1.text!) \(seatsB2.text!) \(seatsB3.text!) \(seatsB4.text!) \(seatsB5.text!)" +
                           "\(seatsC1.text!) \(seatsC2.text!) \(seatsC3.text!) \(seatsC4.text!) \(seatsC5.text!)" +
                           "\(seatsD1.text!) \(seatsD2.text!) \(seatsD3.text!) \(seatsD4.text!) \(seatsD5.text!)"
        
        let defaults = UserDefaults.standard
        defaults.set(seatsAppend.text, forKey: "seats")
        
        defaults.synchronize()
    }
    
    // An event handler when the user choose the seats again
    @IBAction func updateSeats(sender: UIButton) {
        
        seatsAppend.text = "\(seatsAppend.text!) \(seatsA1.text!) \(seatsA2.text!) \(seatsA3.text!) \(seatsA4.text!) \(seatsA5.text!)" +
                            "\(seatsB1.text!) \(seatsB2.text!) \(seatsB3.text!) \(seatsB4.text!) \(seatsB5.text!)" +
                            "\(seatsC1.text!) \(seatsC2.text!) \(seatsC3.text!) \(seatsC4.text!) \(seatsC5.text!)" +
                            "\(seatsD1.text!) \(seatsD2.text!) \(seatsD3.text!) \(seatsD4.text!) \(seatsD5.text!)"
        
        let defaults = UserDefaults.standard
        defaults.set(seatsAppend.text, forKey: "updatedseats")
        
        defaults.synchronize()
        
        
    }
    
   // Segue from seats view controller to booking view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Passing the seats label to the booking view controller
        if let dest = segue.destination as? Anee_BookingViewController {
            dest.seatsLabel = seatsAppend.text
            
        }
    }
    
    // An event handler to change the appearance of the seats button upon selection
    @IBAction func changeStateA1(_ sender: UIButton) {
        if isActiveA1 {
            isActiveA1 = false
            
            A1.tintColor = UIColor.systemGreen
            selectedA1()
            let defaults = UserDefaults.standard
            defaults.set(String(A1.isSelected), forKey: "A1")
            defaults.synchronize()
        }
        else {
            isActiveA1 = true
            A1.tintColor = UIColor.systemBlue
            unSelectedA1()
        }
    }
    
    @IBAction func changeStateA2(_ sender: UIButton) {
        if isActiveA2 {
            isActiveA2 = false
            A2.tintColor = UIColor.systemGreen
            selectedA2()
            let defaults = UserDefaults.standard
            defaults.set(String(A2.isSelected), forKey: "A2")
            defaults.synchronize()
        }
        else {
            isActiveA2 = true
            A2.tintColor = UIColor.systemBlue
            unSelectedA2()
        }
    }
    
    @IBAction func changeStateA3(_ sender: UIButton) {
        if isActiveA3 {
            isActiveA3 = false
            A3.tintColor = UIColor.systemGreen
            selectedA3()
            let defaults = UserDefaults.standard
            defaults.set(String(A3.isSelected), forKey: "A3")
            defaults.synchronize()
        }
        else {
            isActiveA3 = true
            A3.tintColor = UIColor.systemBlue
            unSelectedA3()
        }
    }
    
    @IBAction func changeStateA4(_ sender: UIButton) {
        if isActiveA4 {
            isActiveA4 = false
            A4.tintColor = UIColor.systemGreen
            selectedA4()
            let defaults = UserDefaults.standard
            defaults.set(String(A4.isSelected), forKey: "A4")
            defaults.synchronize()
        }
        else {
            isActiveA4 = true
            A4.tintColor = UIColor.systemBlue
            unSelectedA4()
        }
    }
    
    @IBAction func changeStateA5(_ sender: UIButton) {
        if isActiveA5 {
            isActiveA5 = false
            A5.tintColor = UIColor.systemGreen
            selectedA5()
            let defaults = UserDefaults.standard
            defaults.set(String(A5.isSelected), forKey: "A5")
            defaults.synchronize()
        }
        else {
            isActiveA5 = true
            A5.tintColor = UIColor.systemBlue
            unSelectedA5()
        }
    }
    
    @IBAction func changeStateB1(_ sender: UIButton) {
        if isActiveB1 {
            isActiveB1 = false
            B1.tintColor = UIColor.systemGreen
            selectedB1()
            let defaults = UserDefaults.standard
            defaults.set(String(B1.isSelected), forKey: "B1")
            defaults.synchronize()
        }
        else {
            isActiveB1 = true
            B1.tintColor = UIColor.systemBlue
            unSelectedB1()
        }
    }
    
    @IBAction func changeStateB2(_ sender: UIButton) {
        if isActiveB2 {
            isActiveB2 = false
            B2.tintColor = UIColor.systemGreen
            selectedB2()
            let defaults = UserDefaults.standard
            defaults.set(String(B2.isSelected), forKey: "B2")
            defaults.synchronize()
        }
        else {
            isActiveB2 = true
            B2.tintColor = UIColor.systemBlue
            unSelectedB2()
        }
    }
    
    @IBAction func changeStateB3(_ sender: UIButton) {
        if isActiveB3 {
            isActiveB3 = false
            B3.tintColor = UIColor.systemGreen
            selectedB3()
            let defaults = UserDefaults.standard
            defaults.set(String(B3.isSelected), forKey: "B3")
            defaults.synchronize()
        }
        else {
            isActiveB3 = true
            B3.tintColor = UIColor.systemBlue
            unSelectedB3()
        }
    }
    
    @IBAction func changeStateB4(_ sender: UIButton) {
        if isActiveB4 {
            isActiveB4 = false
            B4.tintColor = UIColor.systemGreen
            selectedB4()
            let defaults = UserDefaults.standard
            defaults.set(String(B4.isSelected), forKey: "B4")
            defaults.synchronize()
        }
        else {
            isActiveB4 = true
            B4.tintColor = UIColor.systemBlue
            unSelectedB4()
        }
    }
    
    @IBAction func changeStateB5(_ sender: UIButton) {
        if isActiveB5 {
            isActiveB5 = false
            B5.tintColor = UIColor.systemGreen
            selectedB5()
            let defaults = UserDefaults.standard
            defaults.set(String(B5.isSelected), forKey: "B5")
            defaults.synchronize()
        }
        else {
            isActiveB5 = true
            B5.tintColor = UIColor.systemBlue
            unSelectedB5()
        }
    }
    
    @IBAction func changeStateC1(_ sender: UIButton) {
        if isActiveC1 {
            isActiveC1 = false
            C1.tintColor = UIColor.systemGreen
            selectedC1()
            let defaults = UserDefaults.standard
            defaults.set(String(C1.isSelected), forKey: "C1")
            defaults.synchronize()
        }
        else {
            isActiveC1 = true
            C1.tintColor = UIColor.systemBlue
            unSelectedC1()
        }
    }
    
    @IBAction func changeStateC2(_ sender: UIButton) {
        if isActiveC2 {
            isActiveC2 = false
            C2.tintColor = UIColor.systemGreen
            selectedC2()
            let defaults = UserDefaults.standard
            defaults.set(String(C2.isSelected), forKey: "C2")
            defaults.synchronize()
        }
        else {
            isActiveC2 = true
            C2.tintColor = UIColor.systemBlue
            unSelectedC2()
        }
    }
    
    @IBAction func changeStateC3(_ sender: UIButton) {
        if isActiveC3 {
            isActiveC3 = false
            C3.tintColor = UIColor.systemGreen
            selectedC3()
            let defaults = UserDefaults.standard
            defaults.set(String(C3.isSelected), forKey: "C3")
            defaults.synchronize()
        }
        else {
            isActiveC3 = true
            C3.tintColor = UIColor.systemBlue
            unSelectedC3()
        }
    }
    
    @IBAction func changeStateC4(_ sender: UIButton) {
        if isActiveC4 {
            isActiveC4 = false
            C4.tintColor = UIColor.systemGreen
            selectedC4()
            let defaults = UserDefaults.standard
            defaults.set(String(C4.isSelected), forKey: "C4")
            defaults.synchronize()
        }
        else {
            isActiveC4 = true
            C4.tintColor = UIColor.systemBlue
            unSelectedC4()
        }
    }
    
    @IBAction func changeStateC5(_ sender: UIButton) {
        if isActiveC5 {
            isActiveC5 = false
            C5.tintColor = UIColor.systemGreen
            selectedC5()
            let defaults = UserDefaults.standard
            defaults.set(String(C5.isSelected), forKey: "C5")
            defaults.synchronize()
        }
        else {
            isActiveC5 = true
            C5.tintColor = UIColor.systemBlue
            unSelectedC5()
        }
    }
    
    @IBAction func changeStateD1(_ sender: UIButton) {
        if isActiveD1 {
            isActiveD1 = false
            D1.tintColor = UIColor.systemGreen
            selectedD1()
            let defaults = UserDefaults.standard
            defaults.set(String(D1.isSelected), forKey: "D1")
            defaults.synchronize()
        }
        else {
            isActiveD1 = true
            D1.tintColor = UIColor.systemBlue
            unSelectedD1()
        }
    }
    
    @IBAction func changeStateD2(_ sender: UIButton) {
        if isActiveD2 {
            isActiveD2 = false
            D2.tintColor = UIColor.systemGreen
            selectedD2()
            let defaults = UserDefaults.standard
            defaults.set(String(D2.isSelected), forKey: "D2")
            defaults.synchronize()
        }
        else {
            isActiveD2 = true
            D2.tintColor = UIColor.systemBlue
            unSelectedD2()
        }
    }
    
    @IBAction func changeStateD3(_ sender: UIButton) {
        if isActiveD3 {
            isActiveD3 = false
            D3.tintColor = UIColor.systemGreen
            selectedD3()
            let defaults = UserDefaults.standard
            defaults.set(String(D3.isSelected), forKey: "D3")
            defaults.synchronize()
        }
        else {
            isActiveD3 = true
            D3.tintColor = UIColor.systemBlue
            unSelectedD3()
        }
    }
    
    @IBAction func changeStateD4(_ sender: UIButton) {
        if isActiveD4 {
            isActiveD4 = false
            D4.tintColor = UIColor.systemGreen
            selectedD4()
            let defaults = UserDefaults.standard
            defaults.set(String(D4.isSelected), forKey: "D4")
            defaults.synchronize()
        }
        else {
            isActiveD4 = true
            D4.tintColor = UIColor.systemBlue
            unSelectedD4()
        }
    }
    
    @IBAction func changeStateD5(_ sender: UIButton) {
        if isActiveD5 {
            isActiveD5 = false
            D5.tintColor = UIColor.systemGreen
            selectedD5()
            let defaults = UserDefaults.standard
            defaults.set(String(D5.isSelected), forKey: "D5")
            defaults.synchronize()
        }
        else {
            isActiveD5 = true
            D5.tintColor = UIColor.systemBlue
            unSelectedD5()
        }
    }
    
   
    // A function to show seat "A1" selected in the seats label
    func selectedA1() {
        seatsA1.text = "A1  \(seatsA1.text!)"
    }
    
    // A function to show seat "A1" unselected in seats label
    func unSelectedA1() {
        seatsA1.text = ""
    }
    
    func selectedA2() {
        seatsA2.text = "A2 \(seatsA2.text!)"
    }
    
    func unSelectedA2() {
        seatsA2.text = ""
    }
    
    func selectedA3() {
        seatsA3.text = "A3 \(seatsA3.text!)"
    }
    
    func unSelectedA3() {
        seatsA3.text = ""
    }
    
    func selectedA4() {
        seatsA4.text = "A4 \(seatsA4.text!)"
    }
    
    func unSelectedA4() {
        seatsA4.text = ""
    }
    
    func selectedA5() {
        seatsA5.text = "A5 \(seatsA5.text!)"
    }
    
    func unSelectedA5() {
        seatsA5.text = ""
    }
    
    
    func selectedB1() {
        seatsB1.text = "B1  \(seatsB1.text!)"
    }
    
    func unSelectedB1() {
        seatsB1.text = ""
    }
    
    func selectedB2() {
        seatsB2.text = "B2 \(seatsB2.text!)"
    }
    
    func unSelectedB2() {
        seatsB2.text = ""
    }
    
    func selectedB3() {
        seatsB3.text = "B3 \(seatsB3.text!)"
    }
    
    func unSelectedB3() {
        seatsB3.text = ""
    }
    
    func selectedB4() {
        seatsB4.text = "B4 \(seatsB4.text!)"
    }
    
    func unSelectedB4() {
        seatsB4.text = ""
    }
    
    func selectedB5() {
        seatsB5.text = "B5 \(seatsB5.text!)"
    }
    
    func unSelectedB5() {
        seatsB5.text = ""
    }
    
    func selectedC1() {
        seatsC1.text = "C1  \(seatsC1.text!)"
    }
    
    func unSelectedC1() {
        seatsC1.text = ""
    }
    
    func selectedC2() {
        seatsC2.text = "C2 \(seatsC2.text!)"
    }
    
    func unSelectedC2() {
        seatsC2.text = ""
    }
    
    func selectedC3() {
        seatsC3.text = "C3 \(seatsC3.text!)"
    }
    
    func unSelectedC3() {
        seatsC3.text = ""
    }
    
    func selectedC4() {
        seatsC4.text = "C4 \(seatsC4.text!)"
    }
    
    func unSelectedC4() {
        seatsC4.text = ""
    }
    
    func selectedC5() {
        seatsC5.text = "C5 \(seatsC5.text!)"
    }
    
    func unSelectedC5() {
        seatsC5.text = ""
    }
    
    
    func selectedD1() {
        seatsD1.text = "D1  \(seatsD1.text!)"
    }
    
    func unSelectedD1() {
        seatsD1.text = ""
    }
    
    func selectedD2() {
        seatsD2.text = "D2 \(seatsD2.text!)"
    }
    
    func unSelectedD2() {
        seatsD2.text = ""
    }
    
    func selectedD3() {
        seatsD3.text = "D3 \(seatsD3.text!)"
    }
    
    func unSelectedD3() {
        seatsD3.text = ""
    }
    
    func selectedD4() {
        seatsD4.text = "D4 \(seatsD4.text!)"
    }
    
    func unSelectedD4() {
        seatsD4.text = ""
    }
    
    func selectedD5() {
        seatsD5.text = "D5 \(seatsD5.text!)"
    }
    
    func unSelectedD5() {
        seatsD5.text = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        
        if let seats = defaults.object(forKey: "seats") as? String
        {
            seatsAppend.text = seats
        }
        
        if let updatedseats = defaults.object(forKey: "updatedseats") as? String
        {
            seatsAppend.text = updatedseats
        }
        
        
        
        if let a1 = defaults.string(forKey: "A1")
        {
            A1.isSelected = Bool(a1)!
            A1.tintColor = UIColor.systemGreen
        }
        if let a2 = defaults.string(forKey: "A2")
        {
            A2.isSelected = Bool(a2)!
            A2.tintColor = UIColor.systemGreen
        }
        if let a3 = defaults.string(forKey: "A3")
        {
            A3.isSelected = Bool(a3)!
            A3.tintColor = UIColor.systemGreen
        }
        if let a4 = defaults.string(forKey: "A4")
        {
            A4.isSelected = Bool(a4)!
            A4.tintColor = UIColor.systemGreen
        }
        if let a5 = defaults.string(forKey: "A5")
        {
            A5.isSelected = Bool(a5)!
            A5.tintColor = UIColor.systemGreen
        }
        if let b1 = defaults.string(forKey: "B1")
        {
            B1.isSelected = Bool(b1)!
            B1.tintColor = UIColor.systemGreen
        }
        if let b2 = defaults.string(forKey: "B2")
        {
            B2.isSelected = Bool(b2)!
            B2.tintColor = UIColor.systemGreen
        }
        if let b3 = defaults.string(forKey: "B3")
        {
            B3.isSelected = Bool(b3)!
            B3.tintColor = UIColor.systemGreen
        }
        if let b4 = defaults.string(forKey: "B4")
        {
            B4.isSelected = Bool(b4)!
            B4.tintColor = UIColor.systemGreen
        }
        if let b5 = defaults.string(forKey: "B5")
        {
            B5.isSelected = Bool(b5)!
            B5.tintColor = UIColor.systemGreen
        }
        if let c1 = defaults.string(forKey: "C1")
        {
            C1.isSelected = Bool(c1)!
            C1.tintColor = UIColor.systemGreen
        }
        if let c2 = defaults.string(forKey: "C2")
        {
            C2.isSelected = Bool(c2)!
            C2.tintColor = UIColor.systemGreen
        }
        if let c3 = defaults.string(forKey: "C3")
        {
            C3.isSelected = Bool(c3)!
            C3.tintColor = UIColor.systemGreen
        }
        if let c4 = defaults.string(forKey: "C4")
        {
            C4.isSelected = Bool(c4)!
            C4.tintColor = UIColor.systemGreen
        }
        if let c5 = defaults.string(forKey: "C5")
        {
            C5.isSelected = Bool(c5)!
            C5.tintColor = UIColor.systemGreen
        }
        if let d1 = defaults.string(forKey: "D1")
        {
            D1.isSelected = Bool(d1)!
            D1.tintColor = UIColor.systemGreen
        }
        if let d2 = defaults.string(forKey: "D2")
        {
            D2.isSelected = Bool(d2)!
            D2.tintColor = UIColor.systemGreen
        }
        if let d3 = defaults.string(forKey: "D3")
        {
            D3.isSelected = Bool(d3)!
            D3.tintColor = UIColor.systemGreen
        }
        if let d4 = defaults.string(forKey: "D4")
        {
            D4.isSelected = Bool(d4)!
            D4.tintColor = UIColor.systemGreen
        }
        if let d5 = defaults.string(forKey: "D5")
        {
            D5.isSelected = Bool(d5)!
            D5.tintColor = UIColor.systemGreen
        }
        
        
        
        
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
