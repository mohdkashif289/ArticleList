//
//  ArticleCell.swift
//  ArticleList
//
//  Created by Kashif Rizvi on 10/05/22.
//

import UIKit

protocol ArticleDelegate: AnyObject {
    func getImage(urlString: String, for imageView: UIImageView)
}

class ArticleCell: UITableViewCell {
    
    var title: String?
    var details: String?
    var imageUrl: String?
    
    let imageview = UIImageView()
    let titleLabel = UILabel()
    let detailLabel = UILabel()

    weak var delegate: ArticleDelegate?
    
    
    func setup(article: Article?) {
//        translatesAutoresizingMaskIntoConstraints = false
        
        
        titleLabel.text = article?.title
        detailLabel.text = article?.description
        imageUrl = article?.urlToImage
        
        setupViews()
        fetchImage()
    }
    
    func fetchImage() {
        guard let imageurl = imageUrl else {
            return
        }
        delegate?.getImage(urlString: imageurl, for: imageview)
    }
    
    func setupViews() {
        imageview.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageview)
        addSubview(titleLabel)
        addSubview(detailLabel)
        
        titleLabel.numberOfLines = 0
        detailLabel.numberOfLines = 0
        
        
        
        imageview.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        imageview.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: imageview.rightAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: detailLabel.topAnchor, constant: -4).isActive = true
        
        detailLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        detailLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
    }


}
