//
//  JashanCell.swift
//  Project_iOS
//  Jashan Goyal
//
//  Created by Jashan Goyal on 2022-03-25.
//

import UIKit

class JashanCell: UITableViewCell {

    let nameLb = UILabel()
    let dateofBookingLb = UILabel()    
    let movieImg = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        nameLb.textAlignment = .left
        nameLb.font = UIFont.boldSystemFont(ofSize: 14)
        nameLb.backgroundColor = .clear
        nameLb.textColor = .white
        
        dateofBookingLb.textAlignment = .left
        dateofBookingLb.font = UIFont.boldSystemFont(ofSize: 14)
        dateofBookingLb.backgroundColor = .clear
        dateofBookingLb.textColor = .white

        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLb)
        contentView.addSubview(dateofBookingLb)
        contentView.addSubview(movieImg)
    }
    
    override func layoutSubviews() {
        nameLb.frame = CGRect(x: 10, y: 20, width: 300, height: 20)
        dateofBookingLb.frame = CGRect(x: 10, y: 50, width: 300, height: 25)
        movieImg.frame = CGRect(x: 300, y: 5, width: 100, height: 100)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
