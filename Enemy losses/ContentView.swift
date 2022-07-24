//
//  ContentView.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            VStack {
                HomeView()
            }
            .navigationTitle(Text("Enemy Losses"))
            .background(Image("flag").ignoresSafeArea(.all).opacity(0.7))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
