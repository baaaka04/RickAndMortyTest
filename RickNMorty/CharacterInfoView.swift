//
//  CharacterInfoView.swift
//  RickNMorty
//
//  Created by Artem Berezin on 2/10/23.
//

import SwiftUI
import RickMortySwiftApi

enum CharaterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
    
    var color: Color {
        switch self {
        case .alive:
            Color.green
        case .dead:
            Color.red
        case .unknown:
            Color.blue
        }
    }
}

struct CharacterInfoView: View {
    let character : RMCharacterModel
    let status : CharaterStatus
    
    init(character: RMCharacterModel) {
        self.character = character
        self.status = CharaterStatus(rawValue: character.status) ?? .unknown
        
    }
    
    var body: some View {
        VStack {
            Text(character.name)
            Text("\(character.status)")
                .foregroundStyle(status.color)
        }
    }
}

#Preview {
    ContentView()
}
