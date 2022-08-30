//
//  NewsCell.swift
//  LikeNews
//
//  Created by Mishana on 30.08.2022.
//

import UIKit

class NewsCell: UITableViewCell {
    
    
    static let reuseId = "News"
    var myImageView = UIImageView()
    var myTitleLabel = UILabel()
    var myDateLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(myImageView)
        addSubview(myTitleLabel)
        addSubview(myDateLabel)
        
        configureImageView()
        configureTitleLabel()
        configureDateLabel()
        
        setImageConstraints()
        setTitleConstraints()
        setDateLabel()
    }
    
    func setData(new: News) {
        myImageView.image = UIImage(named: new.image)
        myTitleLabel.text = new.title
        myDateLabel.text = new.date
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageView() {
        myImageView.layer.cornerRadius  = 10
        myImageView.clipsToBounds       = true
    }
    
    func configureTitleLabel() {
        myTitleLabel.numberOfLines = 1
    }
    
    func configureDateLabel() {
        myDateLabel.numberOfLines = 0
        myDateLabel.adjustsFontSizeToFitWidth = true
    }
}

extension NewsCell {
    func setImageConstraints() {
        myImageView.translatesAutoresizingMaskIntoConstraints                               = false
        myImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive               = true
        myImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        myImageView.heightAnchor.constraint(equalToConstant: 80).isActive                   = true
        myImageView.widthAnchor.constraint(equalToConstant: 80).isActive                    = true
    }
    
    func setTitleConstraints() {
        myTitleLabel.translatesAutoresizingMaskIntoConstraints                                  = false
        myTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                  = true
        myTitleLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 20).isActive  = true
        myTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive                      = true
        myTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setDateLabel() {
        myDateLabel.translatesAutoresizingMaskIntoConstraints                                  = false
        myDateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                  = true
        myDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20).isActive  = true
        myDateLabel.heightAnchor.constraint(equalToConstant: 80).isActive                      = true
        myDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }
    
    
    
}
