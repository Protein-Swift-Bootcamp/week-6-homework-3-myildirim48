//
//  PhotoCellController.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//

import Foundation
import UIKit

class PhotoCellController: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var conteinerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 10
//        imageView.clipsToBounds = true
        conteinerView.layer.cornerRadius = 10
        conteinerView.layer.masksToBounds = true
    }
    
    var newsResult: NewsResult? {
        didSet {
            if let newsResult  {
                
                if let imgUrl = URL(string: newsResult.urlToImage) {
                    imageView.imageFrom(url: imgUrl)
                }
                
                titleLabel.text = newsResult.title
                descriptionLabel.text = newsResult.description
            }
        }
    }
}
