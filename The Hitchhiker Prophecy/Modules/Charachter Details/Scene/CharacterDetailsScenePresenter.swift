//
//  CharacterDetailsScenePresenter.swift
//  The Hitchhiker Prophecy
//
//  Created by Mohamed Tarek on 6/15/20.
//  Copyright (c) 2020 SWVL. All rights reserved.
//
//  Just remember presenters take models and produce view-models
//

final class CharacterDetailsScenePresenter {
    // MARK: - Stored properties
    weak var displayView: CharacterDetailsSceneDisplayLogic?
    
    // MARK: - Init
    init(displayView: CharacterDetailsSceneDisplayLogic) {
        self.displayView = displayView
    }
}

// MARK: - CharacterDetailsPresentationLogic Methods
extension CharacterDetailsScenePresenter: CharacterDetailsScenePresentationLogic {
    func presentCharacter(_ response: CharacterDetailsScene.FetchCharacter.Response) {
        let imageUrl = "\(response.thumbnail.path)/\(CharacterDetailsScene.Constants.ImageSize.Portrait.uncanny.rawValue).\(response.thumbnail.thumbnailExtension)"
        let viewModel = CharacterDetailsScene.FetchCharacter.ViewModel(name: response.name,
                                                                       description: response.resultDescription,
                                                                       imageURL: imageUrl)
        displayView?.didFetchCharacter(viewModel: viewModel)
    }
}
