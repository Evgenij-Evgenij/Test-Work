//
//  FirstView.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

struct FirstView: View {
    @State private var modelPersonal: [ModelPersonal] = []
    
    
    var body: some View {
       
            List(modelPersonal, id: \.date) { personnel in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("День: \(personnel.day)")
                            .font(.callout)
                            .bold()
                        Spacer()
                        Text(personnel.date)
                            .foregroundColor(.gray)
                    }
                    Text("Особового складу: \(personnel.personnel)")
                        .font(.callout)
                    
                    Text("POW: \(personnel.pow ?? 0)")
                    
                    
                    }
                HStack {
                    NavigationLink {
                        SecondView()
                    } label: {
                        Spacer()
                        Text(personnel.more)
                        Spacer()
                            .padding()
                    }
                }
                .foregroundColor(.yellow)
                .font(.title.bold())
                .background(Color.blue)
                    .cornerRadius(10)
                    
            }
            .onAppear() {
                GetData().loadData { (posts) in
                    modelPersonal = posts
                }
        }
        
    }
}


struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        //NavigationView {
            FirstView()
        //}
    }
}

//struct NavigationLinkView: View {
//    var text: String
//    var body: some View {
//        HStack{
//            Spacer()
//            Text (text)
//            Spacer()
//        }
//        .padding()
//        .foregroundColor(.yellow)
//        .font(.title.bold())
//        .background(Color.blue)
//        .cornerRadius(10)
//
//        .frame(minWidth: 1, maxWidth: .infinity, minHeight: 1, maxHeight: .infinity)
//        .background(Color.blue)
//        .cornerRadius(10)
//        .edgesIgnoringSafeArea(.all)
//
//    }
//}
