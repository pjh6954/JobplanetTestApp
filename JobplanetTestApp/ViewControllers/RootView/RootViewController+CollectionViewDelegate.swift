//
//  RootViewController+CollectionViewDelegate.swift
//  JobplanetTestApp
//
//  Created by Dannian Park on 2021/03/26.
//

import Foundation
import UIKit

extension RootViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.searchBarController.isActive {
            if collectionView.tag < 0 || collectionView.tag >= self.searchFilterCompany.count {
                return 0
            }
            let indexRow = collectionView.tag
            return self.searchFilterCompany[indexRow].themes.count
        }else{
            if collectionView.tag < 0 || collectionView.tag >= self.defaultDataResponse.items.count {
                return 0
            }
            let indexRow = collectionView.tag
            return self.defaultDataResponse.items[indexRow].themes.count
        }
        
        //return self.horizontalResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath) as? HorizontalCollectionViewCell else {
            return HorizontalCollectionViewCell(frame: .zero)
        }
        if self.searchBarController.isActive {
            if collectionView.tag >= 0 && collectionView.tag < self.searchFilterCompany.count {
                cell.setData(data: self.searchFilterCompany[collectionView.tag].themes[indexPath.row])
            }
        }else{
            if collectionView.tag >= 0 && collectionView.tag < self.defaultDataResponse.items.count {
                cell.setData(data: self.defaultDataResponse.items[collectionView.tag].themes[indexPath.row])
            }
        }
        
        //cell.setData(data: self.horizontalResult[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("INDEX : \(indexPath)")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 136.5, height: 191)
    }
}
