//
//  TicketDetailViewController.swift
//  Project_iOS
//  JashanGoyal
//
//  Created by Jashan Goyal on 2022-03-25.
//

import UIKit

class JashanTicketDetailViewController: UIViewController {
    
    @IBOutlet var lbName: UILabel!
    @IBOutlet var lbTheatre: UILabel!
    @IBOutlet var lbSeats: UILabel!
    @IBOutlet var lbQuantity: UILabel!
    @IBOutlet var lbType: UILabel!
    @IBOutlet var lbDate: UILabel!
    @IBOutlet var img: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate

        lbName.text = mainDelegate.selectedTicketName
        lbTheatre.text = mainDelegate.selectedTicketTheatre
        lbSeats.text = mainDelegate.selectedTicketSeats
        lbQuantity.text = mainDelegate.selectedTicketQuantity
        lbType.text = mainDelegate.selectedTicketType
        lbDate.text = mainDelegate.selectedTicketDate
        img.image = UIImage(imageLiteralResourceName: mainDelegate.selectedTicketImage)
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
