//
//  NetworkManager.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

class NetworkManager {
    
    func loadPersonellLosses(complition: @escaping (Result<[PersonalModel], NetworkError>) ->()) {
        guard let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") else {
            complition(.failure(NetworkError.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(NetworkError.downloadError))
                return
            }
            do {
                let posts = try JSONDecoder().decode([PersonalModel].self, from: data)
                complition(.success(posts))
            } catch {
                complition(.failure(NetworkError.decodingError))
            }
        }
        .resume()
    }
    
    func loadEquipmentLosses(complition: @escaping (Result<[EquipmentModel], NetworkError>) ->()) {
        guard  let url = URL(string: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") else {
            complition(.failure(NetworkError.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                complition(.failure(NetworkError.downloadError))
                return
            }
            do {
                let posts = try JSONDecoder().decode([EquipmentModel].self, from: data)
                complition(.success(posts))
            } catch {
                complition(.failure(NetworkError.decodingError))
            }
        }
        .resume()
    }
}

enum NetworkError: Error {
    case invalidUrl
    case downloadError
    case decodingError
    var message: String {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .downloadError:
            return "Downloading Error"
        case .decodingError:
            return "Decoding Error"
        }
    }
}


