//
//  CharactersManager.swift
//  RickNMorty
//
//  Created by Artem Berezin on 2/10/23.
//
import Foundation
import RickMortySwiftApi


final class CharactersManager {
    
    private let rmClient = RMClient()
    
    func getAllCharacters () async throws -> [RMCharacterModel] {
        do {
            return try await rmClient.character().getAllCharacters()
        } catch (let error) {
          print(error)
            throw URLError(.badServerResponse)
        }
    }
}
