//
//  HomeSceneViewController.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/10/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit
import SwiftUI

enum LayoutState {
    case horizontal
    case vertical
}

class HomeSceneViewController: UIViewController {
    // MARK: - Stored Properties
    var interactor: HomeSceneBusinessLogic?
    var router: HomeSceneRoutingLogic?

    private var collectionViewDataSource: HomeSceneDataSource?
    
    private var viewState = LayoutState.horizontal {
        didSet {
            collectionViewDataSource?.viewState = viewState
            if viewState == .horizontal {
                collectionViewFlowLayout.scrollDirection = .horizontal
            } else {
                collectionViewFlowLayout.scrollDirection = .vertical
            }
            charactersCollectionView.reloadData()
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var charactersCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    // MARK: - Navigation Bar
    @objc func changeLayoutTapped(_ sender: UIButton) {
        if viewState == .horizontal {
            viewState = .vertical
        } else {
            viewState = .horizontal
        }
        print(viewState)
    }
    
    fileprivate func setupNavigationBarItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Change Layout", style: .plain, target: self, action: #selector(changeLayoutTapped))
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        charactersCollectionView.register(HomeSceneCollectionViewCell.nib, forCellWithReuseIdentifier: HomeSceneCollectionViewCell.identifier)
        interactor?.fetchCharacters()
    }
    
}

extension HomeSceneViewController: HomeSceneDisplayView {
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
        collectionViewDataSource = HomeSceneDataSource(characters: viewModel, viewState: viewState)
        collectionViewDataSource?.delegate = self
        charactersCollectionView.delegate = collectionViewDataSource
        charactersCollectionView.dataSource = collectionViewDataSource
        charactersCollectionView.reloadData()
    }
    
    func failedToFetchCharacters(error: Error) {
        print(error.localizedDescription)
    }
}

extension HomeSceneViewController: HomeSceneDataSourceDelegate {
    func didSelectCharacter(withIndex index: Int) {
        router?.routeToCharacterDetailsWithCharacter(at: index)
    }
}
