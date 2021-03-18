//
//  HomeScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Matloub on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import Foundation

class HomeScenePresneter: HomeScenePresentationLogic {
    weak var displayView: HomeSceneDisplayView?
    
    init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
    }
    
    func presentCharacters(_ response: HomeScene.Search.Response) {
        switch response {
        case .success(let characters):
            var viewModel: [HomeScene.Search.ViewModel] = []
            for character in characters.data.results {
                let imageUrl = "\(character.thumbnail.path)/\(CharacterDetailsScene.Constants.ImageSize.Portrait.uncanny.rawValue).\(character.thumbnail.thumbnailExtension)"
                let characterViewModel = HomeScene.Search.ViewModel(name: character.name,
                                                                    desc: character.resultDescription,
                                                                    imageUrl: imageUrl,
                                                                    comics: "Comics",
                                                                    series: "Series",
                                                                    stories: "Stories",
                                                                    events: "Events")
                viewModel.append(characterViewModel)
            }
            displayView?.didFetchCharacters(viewModel: viewModel)
        case .failure(let errorResponse):
            displayView?.failedToFetchCharacters(error: errorResponse)
        }
    }
}
