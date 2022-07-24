//
//  GetDataEquip.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

class GetDataEquip {
    func getDataequip (complition: @escaping ([ModelEquipment]) -> ()) {
        guard  let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") else {
            print("Invalid Url")
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                print(LocalizedError.self)
                
            } else {
               
                let posts = try! JSONDecoder().decode([ModelEquipment].self, from: data!)
                
                DispatchQueue.main.async {
                    complition(posts)
                }
            }
        }
        .resume()
    }
}
