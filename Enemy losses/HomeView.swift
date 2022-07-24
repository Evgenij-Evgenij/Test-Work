//
//  HomeView.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var personalsLosses: [PersonalModel] = []
    @State private var errorMessage = String()
    
    var body: some View {
        ScrollView {
            Text(errorMessage)
            ForEach(personalsLosses, id: \.date) { personnel in
                PersonnelCell(personnel: personnel)
                    .padding()
            }
        }
        .onAppear() {
            loadData()
        }
    }
    
    func loadData() {
        NetworkManager().loadPersonellLosses { result in
            switch result {
            case .success(let personalsLosses):
                DispatchQueue.main.async {
                    self.personalsLosses = personalsLosses
                }
            case .failure(let error):
                errorMessage = error.message
            
            }
        }
    }
}


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        //NavigationView {
        HomeView()
        //}
    }
}


struct PersonnelCell: View {
    var personnel: PersonalModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("День: \(personnel.day)")
                    .font(.callout)
                    .bold()
                Spacer()
                Text(personnel.date)
                    .foregroundColor(.black.opacity(0.5))
            }
            HStack {
                Text("Особового складу: ")
                    
                Spacer()
                Text("\(personnel.personnel)")
                    .bold()
            }
            .font(.callout)
            
            HStack {
                Text("Полонені:")
                Spacer()
                Text("\(personnel.pow ?? 0)")
                    .bold()
            }
            .font(.callout)
            
            HStack {
                NavigationLink {
                    DetailView(date: personnel.date)
                } label: {
                    Spacer()
                    Text(personnel.more)
                    Spacer()
                       
                }
            }
            .foregroundColor(.yellow)
            .font(.title.bold())
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).opacity(0.5))
    }
}
