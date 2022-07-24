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
                    FirstView()
               
            }
            .navigationTitle(Text("Enemy Losses"))
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
