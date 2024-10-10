//
//  demoTableViewCell.swift
//  CollectionInsideTableView
//
//  Created by Apple on 9/24/24.
//

import UIKit

class demoTableViewCell: UITableViewCell{
    

    @IBOutlet var collectionViewCell: UICollectionView!
    
    var array: EntertainmentApp?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewCell.dataSource = self
        collectionViewCell.delegate = self
        
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        collectionViewCell.register(nib, forCellWithReuseIdentifier: "MyCollectionViewCell")
    }

  
  
    
    
}
extension demoTableViewCell :  UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        array?.imageGallary.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.img.image = UIImage(named: array?.imageGallary[indexPath.row] ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)/2
        return CGSize(width: size, height: size)
    }
   
}
