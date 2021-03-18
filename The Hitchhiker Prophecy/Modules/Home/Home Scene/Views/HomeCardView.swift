//
//  HomeCardView.swift
//  The Hitchhiker Prophecy
//
//  Created by Nada Kamel on 17/03/2021.
//  Copyright © 2021 SWVL. All rights reserved.
//

import SwiftUI

struct HomeCardView: View {
    var characters: [(image: UIImage, name: String)]  = []
    
    var body: some View {
        if !(characters.isEmpty) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack {
                        ForEach (0..<characters.count) { index in
                            CardView(image: characters[index].image, name: characters[index].name)
                        }
                    }
                })
            }
        } else {
            Text("No characters found 😞")
                .font(.subheadline)
                .foregroundColor(.white)
        }
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeCardView()
        }
    }
}

struct CardView: View {
    var image: UIImage
    var name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            Image(uiImage: image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 50, height: 450)
                .scaledToFit()
            
            Text(name)
                .font(.system(size: 18.0, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .padding(.vertical, 5)
                .padding(.leading, 15)
        })
        .frame(width: UIScreen.main.bounds.width - 50, height: 650, alignment: .center)
        .cornerRadius(20)
    }
}
