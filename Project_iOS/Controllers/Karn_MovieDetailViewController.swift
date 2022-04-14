//
//  MovieDetailViewController.swift
//  Project_iOS
//
//  Created by Karn Bhavsar on 2022-03-26.
// View controller to display movie details

import UIKit
import youtube_ios_player_helper

class Karn_MovieDetailViewController: UIViewController,YTPlayerViewDelegate {
    
    var selection: String! // string variable for movie name
    var selection1: String! // string variable for movie summary
    var selection3: String! // string variable for trailer id
    var selection4: String! //Jashan Goyal
    @IBOutlet private weak var MovieLabel: UILabel! // Defining a label for movie  name
    @IBOutlet private weak var MovieSummary: UILabel! // Defining a label for movie  summary
    @IBOutlet var playerView: YTPlayerView! // Defining player view for movie trailer
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MovieLabel.text = selection
        MovieSummary.text = selection1
        playerView.delegate = self
        playerView.load(withVideoId: selection3)
        print(selection4 ?? "NULL");
    }
    
    // A fuction to play the trailer upon loading the page
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    // Anee Patel - Segue to booking view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Passing the movie name to booking view controlelr
        if let dest = segue.destination as? Anee_BookingViewController {
            dest.selection = MovieLabel.text
            dest.selection2 = selection4 // (Jashan Goyal) here movie image name is being sent to booking view Controller Page recieved from movie list
            mainDelegate.selectedMovie = selection4 // (Jashan Goyal) here movie image name is being sent to app delegate recieved from movie list
        }
    }
    // Anee Patel - Segue from booking view controller to movie details view controller
    @IBAction func unwindToDetailViewController(sender : UIStoryboardSegue)
    {
        
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
