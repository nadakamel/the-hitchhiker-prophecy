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

//    fileprivate var contentViewInHC = UIHostingController(rootView: HomeCardView())
    
    private var collectionViewDataSource: HomeSceneDataSource?
    
    private var viewState = LayoutState.horizontal {
        didSet {
            collectionViewDataSource?.viewState = viewState
            if viewState == .horizontal {
                collectionViewFlowLayout.itemSize = CGSize(width: view.frame.width - 50.0,
                                                           height: UIScreen.main.bounds.height - 200)
                collectionViewFlowLayout.scrollDirection = .horizontal
            } else {
                collectionViewFlowLayout.itemSize = CGSize(width: view.frame.width - 50.0,
                                                           height: 200)
                collectionViewFlowLayout.scrollDirection = .vertical
            }
            charactersCollectionView.collectionViewLayout = collectionViewFlowLayout
            charactersCollectionView.reloadData()
        }
    }
    
    // MARK: - Outlets
    private var charactersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HomeSceneCollectionViewCell.self, forCellWithReuseIdentifier: HomeSceneCollectionViewCell.identifier)
        return collectionView
    }()
    
    private var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
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
    
    // MARK: - View Initialisation
    fileprivate func setupCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            charactersCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            charactersCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            charactersCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            charactersCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
    fileprivate func setupCollectionViewUI() {
        view.addSubview(charactersCollectionView)
        setupCollectionViewConstraints()
        collectionViewFlowLayout.itemSize = CGSize(width: view.frame.width - 50.0,
                                                   height: UIScreen.main.bounds.height - 200)
        charactersCollectionView.collectionViewLayout = collectionViewFlowLayout
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        setupCollectionViewUI()
        interactor?.fetchCharacters()
    }
    
    // MARK: - SwiftUI methods
//    fileprivate func setupHomeCardViewConstraints() {
//        contentViewInHC.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            contentViewInHC.view.topAnchor.constraint(equalTo: view.topAnchor),
//            contentViewInHC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            contentViewInHC.view.leftAnchor.constraint(equalTo: view.leftAnchor),
//            contentViewInHC.view.rightAnchor.constraint(equalTo: view.rightAnchor)
//        ])
//    }
//
//    fileprivate func setupHomeCardView(_ viewModel: [HomeScene.Search.ViewModel]) {
//        var charactersList: [(image: UIImage, name: String)]  = []
//        for character in viewModel {
//            let imageUrl = URL(string: character.imageUrl)!
//            let imageData = try! Data(contentsOf: imageUrl)
//            let characterImage = UIImage(data: imageData)
//            charactersList.append((image: characterImage!, name: character.name))
//        }
//        contentViewInHC = UIHostingController(rootView: HomeCardView(characters: charactersList))
//        contentViewInHC.view.backgroundColor = ThemeManager.backgroundColor
//        addChild(contentViewInHC)
//        view.addSubview(contentViewInHC.view)
//        contentViewInHC.didMove(toParent: self)
//        setupHomeCardViewConstraints()
//    }
    
}

extension HomeSceneViewController: HomeSceneDisplayView {
    
    func didFetchCharacters(viewModel: [HomeScene.Search.ViewModel]) {
//        setupHomeCardView(viewModel)
        collectionViewDataSource = HomeSceneDataSource(characters: viewModel, viewState: viewState)
        charactersCollectionView.delegate = collectionViewDataSource
        charactersCollectionView.dataSource = collectionViewDataSource
        charactersCollectionView.reloadData()
    }
    
    func failedToFetchCharacters(error: Error) {
        // TODO: Implement
        print(error.localizedDescription)
    }
}
