//
//  ContentView.swift
//  RickNMorty
//
//  Created by Artem Berezin on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CharacterListView()
        .padding()
        .foregroundColor(.black)
    }
}

#Preview {
    ContentView()
}
