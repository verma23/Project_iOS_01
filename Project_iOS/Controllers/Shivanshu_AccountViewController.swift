//
//  Shivanshu_AccountViewController.swift
//  Project_iOS
//
//  Created by SHivanshu on 2022-04-07.
//

import UIKit

class Shivanshu_AccountViewController: UIViewController {

    
    @IBOutlet var userFullName: UILabel!
    var emailLbl : String!
    @IBOutlet var userEmailInfo: UILabel!
    @IBOutlet var userNumber: UILabel!
    @IBOutlet var userImageOutput: UIImageView!
    
    
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

       userEmailInfo.text = emailLbl
        mainDelegate.confirmDetails(userInfo: mainDelegate.userI!)
        
        userFullName.text = mainDelegate.user_1
        userNumber.text = mainDelegate.user_2
  

    }
 
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue ){
        
        
    }

    

}
