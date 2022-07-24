//
//  SecondView.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

struct SecondView: View {
    @State private var modelEquipment: [ModelEquipment] = []
    
    
    var body: some View {
        List(modelEquipment, id: \.date) { item in
            VStack {
                Text(item.date)
            }
            
        }
        .onAppear() {
            GetDataEquip().getDataequip { (posts) in
                modelEquipment = posts
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
