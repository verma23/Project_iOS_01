//
//  HelpDetailViewController.swift
//  Project_iOS
//
//  Created by  on 2022-03-29.
//

import UIKit

class HelpDetailViewController: UIViewController {
    
    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var answerLabel : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
       // questionLabel.text = mainDelegate.selectedQuestion
        answerLabel.text = mainDelegate.selectedAnswer

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
