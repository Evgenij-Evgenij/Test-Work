//
//  GetData.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

class GetData {
    
    func loadData (complition: @escaping ([ModelPersonal]) -> ()) {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") else {
            return print("Invalid url")
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                print(LocalizedError.self)
            } else {
                let posts = try! JSONDecoder().decode([ModelPersonal].self, from: data!)
                
                DispatchQueue.main.async {
                    complition(posts)
                }
            }
        }
        .resume()
    }
}


