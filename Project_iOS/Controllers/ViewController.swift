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
    
    var searchedMovie = [Movie]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
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
        
        configureSearchController()
        
    }
    
    private func configureSearchController()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
       navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Movie by Name"
    }


    
}

extension ViewController: UICollectionViewDataSource, UISearchResultsUpdating, UISearchBarDelegate, UICollectionViewDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty
        {
            searching = true
            searchedMovie.removeAll()
            for movie in movies
            {
                if movie.title.lowercased().contains(searchText.lowercased())
                {
                    searchedMovie.append(movie)
                }
            }
        }
        else
        {
            searching = false
            searchedMovie.removeAll()
            searchedMovie = movies
        }
        movieCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedMovie.removeAll()
        movieCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching
        {
            return searchedMovie.count
        }
        else
        {
            return movies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        if searching
        {
            cell.setup(with: searchedMovie[indexPath.row])
        }
        else
        {
            cell.setup(with: movies[indexPath.row])
        }
        return cell
        //cell.setup(with: movies[indexPath.row])
        //return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MovieDetailViewController, let index = movieCollectionView.indexPathsForSelectedItems?.first {
            dest.selection = movies[index.row].title
            dest.selection1 = movies[index.row].summary
            dest.selection3 = movies[index.row].trailer
            
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
}





