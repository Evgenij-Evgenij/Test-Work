//
//  DetailView.swift
//  Enemy losses
//
//  Created by Евгений Воронов on 23.07.2022.
//

import SwiftUI

struct DetailView: View {
    
    @State private var equipment: EquipmentModel?
    var date: String
    @State var erroMessage = String()
    
    var body: some View {
        VStack {
            List {
                Section {
                    Group {
                        HStack {
                            Text(equipment?.date ?? "")
                                .font(.title2)
                            Spacer()
                                .foregroundColor(.black.opacity(0.5))
                            Text("День \(equipment?.dayformated ?? "")")
                                .font(.title2)
                        }
                        HStack {
                            Text("Літаки:")
                            Spacer()
                            Text("\(equipment?.aircraft ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Дрони: ")
                            Spacer()
                            Text("\(equipment?.drone ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Гелікоптери:")
                            Spacer()
                            Text("\(equipment?.helicopter ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Танки:")
                            Spacer()
                            Text("\(equipment?.tank ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Бронетранспортери:")
                            Spacer()
                            Text("\(equipment?.apc ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Артилерія:")
                            Spacer()
                            Text("\(equipment?.fieldArtillery ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Ракетні установки:")
                            Spacer()
                            Text("\(equipment?.mrl ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Війскові авто:")
                            Spacer()
                            Text("\(equipment?.militaryAuto ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Автоцистерни:")
                            Spacer()
                            Text("\(equipment?.fuelTank ?? 0)")
                                .bold()
                        }
                    }
                    Group{
                        HStack {
                            Text("Кораблі/Катери:")
                            Spacer()
                            Text("\(equipment?.navalShip ?? 0)")
                                .bold()
                        }
                        HStack {
                            Text("Засоби ППО:")
                            Spacer()
                            Text("\(equipment?.antiAircraftWarfare ?? 0)")
                                .bold()
                        }
                    }
                }
            }
            
            .onAppear() {
                LoadEquipmant()
            }
        }
    }
    func LoadEquipmant() {
        NetworkManager().loadEquipmentLosses { result in
            switch result {
            case .success(let equipLosses):
                DispatchQueue.main.async {
                    self.equipment = equipLosses.first(where: { element in
                        element.date == date
                    })
                }
            case .failure(let error):
                erroMessage = error.message
            }
        }
    }
}


struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            date: "2022-07-17")
    }
}
