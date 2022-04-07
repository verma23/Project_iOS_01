//
//  HelpViewController.swift
//  Project_iOS
//
//  Created by  on 2022-03-28.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var table : UITableView!
    @IBOutlet var tf : UITextField!
    
    
   
    // step 5 - declare array for data
   
    var isfiltered = false
    
    var Data = [String]()
    var Answer = [String]()
    var filteredData = [String]()
    var filteredAnswer = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tf.delegate = self
        setupData()
        // step 5b - define array (could be done above too)
       // listData = ["Jays", "Leafs", "Raptors", "Marlies", "FC"]
        // Do any additional setup after loading the view.
       
       
        
    }
    
    @IBAction func unwindToHelpViewController(sender : UIStoryboardSegue)
    {
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text{
        filterText(text+string)
        }
        return true
    }
    
    func filterText(_ query : String){
        //print("\(query)")
        
        filteredData.removeAll()
        filteredAnswer.removeAll()
        
        for string in Data{
            if string.lowercased().starts(with: query.lowercased())
            {
                filteredData.append(string)
                
            }
        }
        for string in Answer{
            if string.lowercased().starts(with: query.lowercased())
            {
                 filteredAnswer.append(string)
            }
        }
        
        
        table.reloadData()
        
        isfiltered = true
    }
    
    func setupData(){
        Data.append("How do I register in Movieplex?")
        
        Data.append("How do I login in Movieplex?")
        
        Data.append("How do I book my tickets?")
        
        Data.append("How do I view my tickets?")
        
        Data.append("How do I see my account information?")
        
        Data.append("How do I select my seats?")
        
        Data.append("How do I view my receipt?")
        
        
        Answer.append("How do I register in Movieplex? \n\n 1. From the navigation buttons at the bottom, Click on 'Register' icon \n 2. Fill in the fields \n 3. Click on 'Register' button to register in Movieplex")
        
        Answer.append("How do I login in Movieplex? \n\n 1. From the navigation buttons at the bottom, Click on 'Login' icon \n 2. Fill in the email address and password you used while registering \n 3. Click on 'Login' button to login in Movieplex")
        
        Answer.append("How do I book my tickets? \n\n 1. From the navigation buttons at the bottom, Click on 'Movies' icon \n 2. Select the movie (You will be navigated to the Movie details page) \n 3. Click on the button \n 4. Select the seats, date and time, etc. \n 5. Click on 'Book' to book the tickets")
        
        Answer.append("How do I view my tickets? \n\n 1. From the navigation buttons at the bottom, Click on 'Tickets' icon")
        
        Answer.append("How do I see my account information? \n\n 1. From the navigation buttons at the bottom, Click on 'Account' icon")
        
        Answer.append("How do I select my seats? \n\n 1. From the navigation buttons at the bottom, Click on 'Movies' icon \n 2. Select the movie (You will be navigated to the Movie details page) \n 3. Click on the 'Choose Seats' button \n 4. Select the seats (Select again if you want to unselect) \n 5. Click on back button to go back to the booking page")
        
        Answer.append("How do I view my receipt? \n\n 1. After booking the ticket, Click on 'View Receipt' to view your receipt")
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table Methods
    
    // step 6 - define Table Delegate method for number of cells to instantiate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        if !filteredData.isEmpty{
            return filteredData.count
        }
        
        return Data.count
    }

    // step 7 - define Table Delegate method for height for each cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // step 8 - define how each cell should look and its data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        if !filteredData.isEmpty{
            tableCell.textLabel?.text = filteredData[indexPath.row]
        }
        else{
            tableCell.textLabel?.text = Data[indexPath.row]
        }
        
        
        tableCell.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        tableCell.textLabel?.numberOfLines = 0
        tableCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "bg_main.jpg"))
        
        tableCell.backgroundColor = .clear
        tableCell.backgroundColor = UIColor(white: 1, alpha: 0.4)
        
        tableCell.accessoryType = .disclosureIndicator
        
        return tableCell
        
    }
    
    // step 9 making cells editable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowNum = indexPath.row
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // step 13d - save url
        if !filteredData.isEmpty{
           // mainDelegate.selectedQuestion = filteredData[rowNum]
            mainDelegate.selectedAnswer = filteredAnswer[rowNum]
        }
        else
        {
           // mainDelegate.selectedQuestion = Data[rowNum]
            mainDelegate.selectedAnswer = Answer[rowNum]
        }
        
        
        // step 13e - move to ViewSiteViewController screen
        // first define "ChooseSegueToView" in SB
        // move on to ViewSiteViewController.swift
        performSegue(withIdentifier: "ChooseSegueToView", sender: nil)
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

