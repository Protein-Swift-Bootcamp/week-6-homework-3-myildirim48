//
//  ViewController.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//

import UIKit
class ViewController: UICollectionViewController {
    
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    var newsOnUi : [NewsResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView?.contentInset = UIEdgeInsets(top: 12, left: 4, bottom: 12, right: 4)
        
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
    fileprivate func loadSportData(){
        Network.shared.fetchSport { newsData, err in
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
    fileprivate func loadhealthData(){
        Network.shared.fetchHealth { newsData, err in
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
    fileprivate func loadScienceData(){
        Network.shared.fetchScience { newsData, err in
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
    fileprivate func loadBussinesData(){
        Network.shared.fetchBussines { newsData, err in
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
    }
    
    //Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCellid", for: indexPath) as! CategoryHeader
            return headerView
        }else {
            return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCellid", for: indexPath)
        }
    }
    
}



//Pinterest Layout
extension ViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForCaptionAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
        
        let post = newsOnUi[indexPath.item]
        let totalText = post.title + post.description
        
        let topPadding = CGFloat(8)
        let bottomPadding = CGFloat(12)
        let captionFont = UIFont.systemFont(ofSize: 14)
        let captionHeight = self.height(for: totalText, with: captionFont, width: width)
        let height = topPadding + captionHeight + topPadding + bottomPadding
        
        return height
        
    }
    
    func height(for text: String, with font: UIFont, width: CGFloat) -> CGFloat
    {
        let nsstring = NSString(string: text)
        let maxHeight = CGFloat(MAXFLOAT)
        let textAttributes = [NSAttributedString.Key.font : font]
        let boundingRect = nsstring.boundingRect(with: CGSize(width: width, height: maxHeight), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
        return ceil(boundingRect.height)
    }
    
    
}


