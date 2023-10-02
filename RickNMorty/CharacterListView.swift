//
//  CharacterListView.swift
//  RickNMorty
//
//  Created by Artem Berezin on 2/10/23.
//

import SwiftUI
import RickMortySwiftApi

@MainActor
final class CharacterListViewModel : ObservableObject {
    
    @Published var characters: [RMCharacterModel] = []
    let charactersManager: CharactersManager
    
    init(charactersManager: CharactersManager) {
        self.charactersManager = charactersManager
    }
    
    func getAllCharacters() {
        Task {
            characters = try await charactersManager.getAllCharacters()
        }
    }
    
}

struct CharacterListView: View {
    @StateObject var vm = CharacterListViewModel(charactersManager: CharactersManager())
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.characters) { character in
                    NavigationLink {
                        CharacterInfoView(character: character)
                    } label: {
                        CharacterView(character: character)
                    }
                }
            }
            .task {
                vm.getAllCharacters()
            }
        }
    }
}

#Preview {
    CharacterListView()
}
