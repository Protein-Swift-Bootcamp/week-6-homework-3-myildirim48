//
//  ViewController.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var newsOnUi : [NewsResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadData()
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    
    fileprivate func loadData(){
        Network.shared.fetchData { newsData, err in
            if let err {
                print("error while fetching data",err.localizedDescription)
            }
            if let newsData {
              
                DispatchQueue.main.async {
                    self.newsOnUi = newsData.articles
                    self.collectionView.reloadData()
                }
                
            }
        }
    }

}

//Collection view datasource
extension ViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsOnUi.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellid, for: indexPath) as! PhotoCellController
        cell.newsResult = newsOnUi[indexPath.item]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: newsOnUi[indexPath.item].url) {
            CustomeBroweser(controller: UIWindow.key?.rootViewController).open(openURL: url)
        }
        
print(newsOnUi[indexPath.item].url)
    }
    
}



//Pinterest Layout
extension ViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
            let post = newsOnUi[indexPath.item]
            let topPadding = CGFloat(8)
            let bottomPadding = CGFloat(8)
        let totalText = post.title + post.description
        let captionHeight = self.height(for: totalText, width: width)
            let height = topPadding + captionHeight + topPadding  + bottomPadding + 270
            
            return height
     
    }
    
    func height(for text: String, width: CGFloat) -> CGFloat
    {
        let nsstring = NSString(string: text)
        let maxHeight = CGFloat(550)
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, context: nil)
        return ceil(boundingRect.height)
    }
    
    
}


