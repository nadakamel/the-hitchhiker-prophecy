//
//  HomeSceneDataSource.swift
//  The Hitchhiker Prophecy
//
//  Created by Nada Kamel on 17/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import UIKit

protocol HomeSceneDataSourceDelegate: class {
    func didSelectCharacter(withIndex index: Int)
}

class HomeSceneDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var characters: [HomeScene.Search.ViewModel]
    var viewState: LayoutState

    weak var delegate: HomeSceneDataSourceDelegate?
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSceneCollectionViewCell.identifier,
                                                      for: indexPath) as! HomeSceneCollectionViewCell
        cell.character = characters[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(characters[indexPath.item].name) Selected")
        delegate?.didSelectCharacter(withIndex: indexPath.item)
    }
}

extension HomeSceneDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = collectionView.frame.width - 50.0
        var height: CGFloat = 480
        if viewState == .vertical {
            width = collectionView.frame.width - 10.0
            height = 170
        }
        return CGSize(width: width, height: height)
    }
}
