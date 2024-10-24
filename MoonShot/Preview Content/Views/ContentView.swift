//
//  ContentView.swift
//  MoonShot
//
//  Created by Meet Mistry on 22/10/24.
//

import SwiftUI

// TODO:
// Add the launch date to MissionView, below the mission badge. You might choose to format this differently given that more space is available, but it’s down to you.
// Extract one or two pieces of view code into their own new SwiftUI views – the horizontal scroll view in MissionView is a great candidate, but if you followed my styling then you could also move the Rectangle dividers out too.
// For a tough challenge, add a toolbar item to ContentView that toggles between showing missions as a grid and as a list.

//Group {
//    if showingGrid {
//        GridLayout(astronauts: astronauts, missions: missions)
//    } else {
//        ListLayout(astronauts: astronauts, missions: missions)
//    }
//}
//.navigationTitle("My Group")

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) {mission in
                        NavigationLink {
                            MissionView(
                                mission: mission,
                                astronauts: astronauts
                            )
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            )
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("MoonShot")
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
