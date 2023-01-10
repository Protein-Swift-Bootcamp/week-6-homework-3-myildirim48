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
        
        conteinerView.layer.cornerRadius = 6
        conteinerView.layer.masksToBounds = true
    }
    
    var newsResult: NewsResult? {
        didSet {
            if let newsResult  {
                
                if let imgUrl = URL(string: newsResult.image) {
                    imageView.imageFrom(url: imgUrl)
                }
                
                titleLabel.text = newsResult.name
                descriptionLabel.text = newsResult.description
            }
        }
    }
}
