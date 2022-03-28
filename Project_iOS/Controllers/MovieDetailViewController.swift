//
//  MovieDetailViewController.swift
//  Project_iOS
//
//  Created by  on 2022-03-26.
//

import UIKit
import youtube_ios_player_helper

class MovieDetailViewController: UIViewController,YTPlayerViewDelegate {
    
    var selection: String!
    var selection1: String!
    var selection3: String!
    @IBOutlet private weak var MovieLabel: UILabel!
    @IBOutlet private weak var MovieSummary: UILabel!
    @IBOutlet var playerView: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MovieLabel.text = selection
        MovieSummary.text = selection1
        playerView.delegate = self
        playerView.load(withVideoId: selection3)
        
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
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
