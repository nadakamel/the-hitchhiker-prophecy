//
//  HomeSceneInteractorTests.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Nada Kamel on 19/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

@testable import The_Hitchhiker_Prophecy
import XCTest
import UIKit

class HomeSceneInteractorTests: XCTestCase {

    // MARK: - Subject under test
    var sut: HomeSceneInteractor!
      
    // MARK: - Test lifecycle
    override func setUp() {
        super.setUp()
        setupHomeSceneInteractor()
    }
      
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
      
    // MARK: - Test Setup
    func setupHomeSceneInteractor() {
        workerSpy = HomeWorkerSpy()
        presentationLogicSpy = HomeScenePresentationLogicSpy()
        sut = HomeSceneInteractor(worker: workerSpy, presenter: presentationLogicSpy)
    }
    
    // MARK: - Test Doubles
    var workerSpy: HomeWorkerType!
    var presentationLogicSpy: HomeScenePresentationLogicSpy!

    class HomeWorkerSpy: HomeWorkerType {
        private let service = CharacterNetworkService()
        var getCharactersCalled = false
        
        func getCharacters(_ input: Characters.Search.Input, completion: @escaping (HomeScene.Search.Response) -> Void) {
            getCharactersCalled = true
        }
    }

    class HomeScenePresentationLogicSpy: HomeScenePresentationLogic {
        var displayView: HomeSceneDisplayView?
        var presentCharactersCalled = false
        
        func presentCharacters(_ response: HomeScene.Search.Response) {
            presentCharactersCalled = true
        }
    }
    
    // MARK: - Tests
    func testFetchCharactersCallsWorkerToFetch() {
        // Given
        let spy = HomeWorkerSpy()
        let sut = HomeSceneInteractor(worker: spy, presenter: HomeScenePresentationLogicSpy())
        
        // When
        sut.fetchCharacters()

        // Then
        XCTAssert(spy.getCharactersCalled, "fetchCharacters() should ask the worker to fetch the characters")
    }
}
