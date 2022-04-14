//
//  ViewController.swift
//  Project_iOS
//
//  Created by Karn Bhavsar on 2022-03-02.
// This view controller is for displaying the movie list

import UIKit

class Karn_MoviesListViewController: UIViewController {

    
    @IBOutlet weak var movieCollectionView: UICollectionView! // Defining movie collection view
    
    
    var emailbl : String! // Shivanshu Verma - Defining the string variable email label
    @IBOutlet var userEmailInfo: UILabel! // Shivanshu Verma - Defining the user email info label
    
    
    // UIStoryboardSegue to movies list view controller
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue ){
        
        
    }
    // Defining the background image for collection view
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

// Extention for Collection view datasource and delegate
extension Karn_MoviesListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
     
    // It returns all the movies list
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return movies.count
        
    }
    
    // To populate each cell in the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
       
        cell.setup(with: movies[indexPath.row])
        return cell
    }
    
    // Segue to movie details view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //passing the title, summary and trailer to movie details view controller
        if let dest = segue.destination as? Karn_MovieDetailViewController, let index = movieCollectionView.indexPathsForSelectedItems?.first {
            dest.selection = movies[index.row].title
            dest.selection1 = movies[index.row].summary
            dest.selection3 = movies[index.row].trailer
            dest.selection4 = movies[index.row].imageName  //Jashan - sent to movie detail view controller
    
        }
        // passing the email to Account ViewController
        if let dest1 = segue.destination as?  Shivanshu_AccountViewController{
            dest1.emailLbl = userEmailInfo.text
           
            
        }
    }
    
    
}

// collection view layout to display how many movies go in each row
extension Karn_MoviesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}





