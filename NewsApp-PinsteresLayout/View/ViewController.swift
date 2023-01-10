//
//  ViewController.swift
//  NewsApp-PinsteresLayout
//
//  Created by YILDIRIM on 10.01.2023.
//

import UIKit

final class ViewController: UICollectionViewController {
    
    var newsOnUi : [NewsResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadData()
        collectionView.reloadData()
    }
    
    
    fileprivate func loadData(){
        Network.shared.fetchData { newsData, err in
            if let err {
                print("error while fetching data",err.localizedDescription)
            }
            if let newsData {
                self.newsOnUi = []
                self.newsOnUi = newsData.articles
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }
        }
    }
    
    private let itemsPerRow:CGFloat = 2
    private let sectionInsets = UIEdgeInsets(
        top: 50.0,
        left: 20.0,
        bottom: 50.0,
        right: 20.0)
}

//Collection view datasource
extension ViewController{
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsOnUi.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellid, for: indexPath) as! PhotoCellController
        cell.newsResult = newsOnUi[indexPath.item]
        return cell
    }
    
}

//FlowLayout Delegate extension
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}


