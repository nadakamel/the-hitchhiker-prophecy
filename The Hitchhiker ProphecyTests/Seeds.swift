//
//  Seeds.swift
//  The Hitchhiker ProphecyTests
//
//  Created by Nada Kamel on 19/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

@testable import The_Hitchhiker_Prophecy
import XCTest

struct Seeds {
    struct Characters {
        static var dummyCharacter1: HomeScene.Search.ViewModel {
            return .init(name: "HULK",
                         desc: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.",
                         imageUrl: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0/portrait_uncanny.jpg",
                         comics: "Comics",
                         series: "Series",
                         stories: "Stories",
                         events: "Events")
        }
        
        static var dummyCharacter2: HomeScene.Search.ViewModel {
            return .init(name: "Guardians of the Galaxy",
                         desc: "A group of cosmic adventurers brought together by Star-Lord, the  Guardians of the Galaxy protect the universe from threats all  across space. The team also includes Drax, Gamora, Groot and Rocket  Raccoon!",
                         imageUrl: "http://i.annihil.us/u/prod/marvel/i/mg/2/70/50febd8be6b5d/portrait_uncanny.jpg",
                         comics: "Comics",
                         series: "Series",
                         stories: "Stories",
                         events: "Events")
        }
        
        static var dummyCharacter3: HomeScene.Search.ViewModel {
            return .init(name: "Avengers",
                         desc: "Earth\'s Mightiest Heroes joined forces to take on threats that were too big for any one hero to tackle. With a roster that has included Captain America, Iron Man, Ant-Man, Hulk, Thor, Wasp and dozens more over the years, the Avengers have come to be regarded as Earth\'s No. 1 team.",
                         imageUrl: "http://i.annihil.us/u/prod/marvel/i/mg/9/20/5102c774ebae7/portrait_uncanny.jpg",
                         comics: "Comics",
                         series: "Series",
                         stories: "Stories",
                         events: "Events")
        }
        
        static var dummyCharacters = [dummyCharacter1, dummyCharacter2, dummyCharacter3]
    }
}
