//
//  MovieCollectionViewCell.swift
//  Project_iOS
//
//  Created by Karn Bhavsar  on 2022-03-25.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    func setup(with movie: Movie) {
        movieImageView.image = movie.image
        movieTitle.text = movie.title
    }
    
}
