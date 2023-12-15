//
//  ContentView.swift
//  SwiftUI Subviews
//
//  Created by Tyler May on 12/15/23.
//

import SwiftUI

struct Sport {
    var name: String
}

struct FavoriteSport: View {
    
    let sports = [
    Sport(name: "Golf"),
    Sport(name: "Football"),
    Sport(name: "Soccer"),
    Sport(name: "Baseball")
    ]
    
    @State var selectedButton: String = ""
    @State var submitted = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Favorite Sport")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(sports, id: \.name) { sport in
                        Button {
                            selectedButton = sport.name
                           submitted = false
                        } label: {
                            Text(sport.name)
                                .padding()
                                .frame(width: 115, height: 115)
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.green)
                                )
                                .opacity(selectedButton == sport.name ? 1 : 0.6)
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(75)
                
                Spacer()
                Button {
                    submitted = true
                } label: {
                    Text("Submit")
                        .padding()
                        .frame(width: 300)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.blue))
                }
                .foregroundColor(.white)
                Spacer()
                if submitted {
                    Text("You choose \(selectedButton)!")
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}

struct FavortieSport_Preview: PreviewProvider {
    static var previews: some View {
        FavoriteSport()
    }
}
