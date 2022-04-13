//
//  LoginViewController.swift
//  Project_iOS
//
//  Created by Shivanshu Verma on 2022-03-11.
//

import UIKit



class Shivanshu_LoginViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var userEmail: UITextField!
    
    @IBOutlet var userPass: UITextField!
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func unwindToLoginViewController(sender : UIStoryboardSegue)
    {
        
    }
   
    @IBAction func CheckTextFields(_ sender: Any)
    {
        let userEmailAdd = userEmail.text
        let user_Pass = userPass.text
        
        if(((userEmailAdd?.isEmpty) == true) || ((user_Pass?.isEmpty) == true))
        {
            displayMyAlerMessage(userMessage: "All Fields Are Required")
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as?  Karn_MoviesListViewController{
            dest.emailbl = userEmail.text
           
            
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    @IBAction func verifyuserLogin()
    {

        var result = mainDelegate.VerifyLoginFromDatase(uEmail: userEmail.text!, uPass: userPass.text!)



        if(result == true)
        {
            
            performSegue(withIdentifier: "ViewController", sender: self)
         
        }
    }
    
    
    func displayMyAlerMessage(userMessage : String)
    {
        var myAlert = UIAlertController(title: "App Alert", message: userMessage, preferredStyle: .alert)
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
