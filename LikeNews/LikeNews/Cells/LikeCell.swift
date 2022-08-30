//
//  LikeCell.swift
//  LikeNews
//
//  Created by Mishana on 30.08.2022.
//

import UIKit

class LikeCell: UITableViewCell {
    
    
    static let reuseId = "Like"
    var myImageView = UIImageView()
    var myTitleLabel = UILabel()
    var myDescriptionLabel = UILabel()
    var myDateLabel = UILabel()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(myImageView)
        addSubview(myTitleLabel)
        addSubview(myDescriptionLabel)
        addSubview(myDateLabel)
        
        configureImageView()
        configureTitleLabel()
        configureDescriptionLabel()
        configureDateLabel()
        
        setImageConstraints()
        setTitleConstraints()
        setDescriptionLabel()
        setDateLabel()
    }
    
    func setLike(like: News) {
        myImageView.image = UIImage(named: like.image)
        myTitleLabel.text = like.title
        myDescriptionLabel.text = like.description
        myDateLabel.text = like.date
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
    
    func configureDescriptionLabel() {
        myDescriptionLabel.numberOfLines = 0
        myDescriptionLabel.adjustsFontSizeToFitWidth = true
    }
    func configureDateLabel() {
        myDateLabel.numberOfLines = 0
        myDateLabel.adjustsFontSizeToFitWidth = true
    }
}

extension LikeCell {
    func setImageConstraints() {
        myImageView.translatesAutoresizingMaskIntoConstraints                               = false
        myImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive               = true
        myImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        myImageView.heightAnchor.constraint(equalToConstant: 80).isActive                   = true
        myImageView.widthAnchor.constraint(equalToConstant: 80).isActive                    = true
    }
    
    func setTitleConstraints() {
        myTitleLabel.translatesAutoresizingMaskIntoConstraints                                  = false
        myTitleLabel.centerYAnchor.constraint(equalTo: topAnchor, constant: 20).isActive                  = true
        myTitleLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 20).isActive  = true
        myTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive                      = true
        myTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setDescriptionLabel() {
        myDescriptionLabel.translatesAutoresizingMaskIntoConstraints                                  = false
        myDescriptionLabel.centerYAnchor.constraint(equalTo: myTitleLabel.bottomAnchor, constant: -5).isActive                  = true
        myDescriptionLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 20).isActive  = true
        myDescriptionLabel.heightAnchor.constraint(equalToConstant: 80).isActive                      = true
        myDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setDateLabel() {
        myDateLabel.translatesAutoresizingMaskIntoConstraints                                  = false
        myDateLabel.centerYAnchor.constraint(equalTo: topAnchor, constant: 20).isActive                  = true
        myDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20).isActive  = true
        myDateLabel.heightAnchor.constraint(equalToConstant: 80).isActive                      = true
        myDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }
    
    
    
}
