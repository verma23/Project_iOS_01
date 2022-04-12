//
//  HelpDetailViewController.swift
//  Project_iOS
//
//  Created by Anee Patel  on 2022-03-29.
// this is the view controller to display the answer to the question selected in the help view controller

import UIKit

class Anee_HelpDetailViewController: UIViewController {
    
    @IBOutlet var questionLabel : UILabel! // Label for the question
    @IBOutlet var answerLabel : UILabel! // Label for the answer
    

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
