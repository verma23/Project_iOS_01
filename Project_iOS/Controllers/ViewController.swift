//
//  ViewController.swift
//  Project_iOS
//
//  Created by Karn Bhavsar on 2022-03-02.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    var searching = false
    var emailbl : String! 
    @IBOutlet var userEmailInfo: UILabel!
    
    
    
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue ){
        
        
    }
    
    let backgroundImage : UIImageView = {
        let bg = UIImageView()
        bg.image = UIImage(imageLiteralResourceName: "bg_main")
        bg.contentMode = .scaleAspectFill
        bg.alpha = 0.5
        return bg
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.movieCollectionView?.backgroundView = backgroundImage
        
        userEmailInfo.text = emailbl
        
        
        
    }
    
    
    
    


    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
     
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
       
        cell.setup(with: movies[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MovieDetailViewController, let index = movieCollectionView.indexPathsForSelectedItems?.first {
            dest.selection = movies[index.row].title
            dest.selection1 = movies[index.row].summary
            dest.selection3 = movies[index.row].trailer
            
        }
        if let dest1 = segue.destination as?  Shivanshu_AccountViewController{
            dest1.emailLbl = userEmailInfo.text
           
            
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}





