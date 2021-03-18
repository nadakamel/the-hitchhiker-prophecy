//
//  HomeSceneDataSource.swift
//  The Hitchhiker Prophecy
//
//  Created by Nada Kamel on 17/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

class HomeSceneDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var characters: [HomeScene.Search.ViewModel]
    var viewState: LayoutState

    init(characters: [HomeScene.Search.ViewModel], viewState: LayoutState) {
        self.characters = characters
        self.viewState = viewState
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeSceneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSceneCollectionViewCell.identifier,
                                                                                   for: indexPath) as! HomeSceneCollectionViewCell
        cell.configCell(character: characters[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(characters[indexPath.item].name) Selected")
    }
}

extension HomeSceneDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if viewState == .horizontal {
            return CGSize(width: collectionView.frame.width - 50.0, height: UIScreen.main.bounds.height - 200)
        } else {
            return CGSize(width: collectionView.frame.width - 50.0, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
