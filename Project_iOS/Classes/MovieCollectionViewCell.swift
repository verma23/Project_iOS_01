//
//  MovieCollectionViewCell.swift
//  Project_iOS
//
//  Created by Karn Bhavsar  on 2022-03-25.
// A class for collection view cell for movies list

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView! // To store the movie image in image view
    @IBOutlet weak var movieTitle: UILabel! // Label to store movie title
    
    // A function to hold movie list information like movie image and movie title
    func setup(with movie: Movie) {
        movieImageView.image = movie.image
        movieTitle.text = movie.title
    }
    
}
