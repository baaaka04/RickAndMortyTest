//
//  CharacterView.swift
//  RickNMorty
//
//  Created by Artem Berezin on 2/10/23.
//

import SwiftUI
import RickMortySwiftApi

struct CharacterView: View {
    var character : RMCharacterModel
    
    var body: some View {
        HStack (alignment: .center) {
            AsyncImage(url: URL(string: character.image)) { phase in
                  switch phase {
                  case .empty:
                      Image(systemName: "photo")
                          .frame(width: 60, height: 60)
                  case .success(let image):
                      image.resizable()
                          .aspectRatio(contentMode: .fit)
                          .frame(maxWidth: 60, maxHeight: 60)
                  case .failure:
                      Image(systemName: "photo")
                          .frame(width: 60, height: 60)
                  @unknown default:
                      EmptyView()
                          .frame(width: 60, height: 60)
                  }
              }
              .frame(width: 60, height: 60)
              .cornerRadius(60)
            Text(character.name)
        }
    }
}

#Preview {
    ContentView()
}
