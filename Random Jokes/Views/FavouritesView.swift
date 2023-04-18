//
//  FavouritesView.swift
//  Random Jokes
//
//  Created by Tom Wu on 2023-04-18.
//
import Blackbird
import SwiftUI

struct FavouritesView: View {
    
    @BlackbirdLiveModels({ db in
        try await Joke.read(from: db)
    }) var favouriteJokes
    
    var body: some View {
        List(favouriteJokes.results){ currentJoke in
            VStack(alignment: .leading){
                Text(currentJoke.setup)
                    .bold()
                Text(currentJoke.punchline)
            }
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
