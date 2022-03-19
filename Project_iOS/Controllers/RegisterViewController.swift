//
//  RegisterViewController.swift
//  Project_iOS
//
//  Created by Shivanshu Verma on 2022-03-11.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet  var tFname: UITextField!
    
    @IBOutlet var tLname: UITextField!
    
    @IBOutlet var tEmailAdd: UITextField!
    @IBOutlet var tPnum: UITextField!
    @IBOutlet var tNewPass: UITextField!
    @IBOutlet var tConfirmPass: UITextField!
    
  
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
 
    @IBAction func addUserToDatabase(sender : Any){
        let person = Data.init()
        person.initWithData(theRow: 0, theFname: tFname.text!, theLname: tLname.text!, theEmail: tEmailAdd.text!,thePhone: tPnum.text!, theNpass: tNewPass.text!, theConfirmpass: tConfirmPass.text!)
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let returnCode = mainDelegate.insertIntoDatabase(person: person)
                var reutrnMSG : String = "Person Added"
                if returnCode == false{
                    reutrnMSG = "Person Add Failed"
                }
        displayMyAlerMessage(userMessage: "User added ")
        
        
    }
    
    @IBAction func RegisterUser(_ sender: Any) {
        let firstName = tFname.text;
        let lastName = tLname.text;
        let emailAddress = tEmailAdd.text;
        let phoneNum = tPnum.text;
        let newPass = tNewPass.text;
        let confirmPass = tConfirmPass.text;
        
        if(((firstName?.isEmpty) == true) || ((lastName?.isEmpty) == true) || ((emailAddress?.isEmpty) == true) || ((confirmPass?.isEmpty) == true) || ((newPass?.isEmpty) == true))
        {
            displayMyAlerMessage(userMessage: "All Fields are required")
            
            return;
    }
    if( newPass != confirmPass)
        {
        displayMyAlerMessage(userMessage: "Password Should Match")
    }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    func displayMyAlerMessage(userMessage : String)
    {
        var myAlert = UIAlertController(title: "Warning", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        myAlert.addAction(okAction)
        present(myAlert, animated: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
