//
//  PartyDetailsView.swift
//  PartyTime
//
//  Created by Carlos Amaral on 12/02/22.
//

import SwiftUI

struct PartyDetailsView: View {
    
    @State private var organizer : String? = "Organizador"
    @State private var age : String? = "Faixa etária"
    @State private var slots : Int? = 1000
    @State private var day : Date? = Date()
    @State private var time : String? = "Horário"
    @State private var placeName : String? = "Nome do local"
    @State private var address : String? = "Endereço"
    @State private var distancy : Float? = 0.0
    @State private var drinks : String? = "Bebidas"
    @State private var food : String? = "Comidas"
    
    @State private var errorWhileCalling : Bool = false
    
    let baseURL : String = "tel:"
    var phone : String = ""
    
    func Call() {
        
        if phone.isEmpty {
            self.errorWhileCalling = true
        } else {
            if let url = URL(string: "\(baseURL)\(phone)") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    
                    Section(header: Text("Importante")) {
                        //  Organizador(a)
                        NavigationLink(destination: MapView()) {
                            ListItem(lineTitle: "Organizador(a)(e): ", lineText: self.organizer!)
                        }
                        
                        //  Faixa Etária
                        ListItem(lineTitle: "Faixa etária: ", lineText: self.age!)
                        
                        //  Vagas
                        ListItem(lineTitle: "Vagas: ", lineText: "\(self.slots!)")
                    }
                    
                    
                    Section(header: Text("Data")) {
                        //  Data
                        ListItem(lineTitle: "Dia: ", lineText: "\(self.day!.formatted(.dateTime.day().month().year()))")
                        
                        //  Horário
                        ListItem(lineTitle: "Horário: ", lineText: "\(self.time!)")
                    }
                    
                    
                    Section(header: Text("Localização")) {
                        //  Nome da casa
                        ListItem(lineTitle: "Nome do local: ", lineText: "\(self.placeName!)")
                        
                        //  Local
                        ListItem(lineTitle: "Endereço: ", lineText: "\(self.address!)")
                        
                        //  Distancia
                        ListItem(lineTitle: "Distância: ", lineText: "\(self.distancy!) km")
                    }
                    
                    
                    Section(header: Text("Alimentação")) {
                        //  Bebidas
                        ListItem(lineTitle: "Bebidas: ", lineText: "\(self.drinks!)")
                        
                        //  Comidas
                        ListItem(lineTitle: "Comidas: ", lineText: "\(self.food!)")
                    }
                    
                    
                    Section(header: Text("")) {
                        ButtonItem()
                    }
                    
                }
                .listStyle(.inset)
            }
            .navigationTitle("Festa no Joaozinho")
            .navigationBarItems(
                trailing:
                    Image(systemName: "phone")
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            Call()
                        }
            )
            .alert("Ocorreu um erro, estamos notificando o organizador", isPresented: $errorWhileCalling) {
                Button("Beleza!", role: .cancel) {
                    self.errorWhileCalling = false
                }
            }
        }
    }
}

struct ListItem : View {
    
    var lineTitle : String? = ""
    var lineText : String? = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(lineTitle!)
                    .foregroundColor(.accentColor)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                
                Text(lineText!)
            }
        }
        .font(.callout)
        .frame(height: 40)
        
    }
}

struct ButtonItem : View {
    
    @State private var willGo : Bool = true
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                willGo.toggle()
            } label: {
                Text(willGo ? "🎊    Confirmar presença!    🎉" : "😪    Desmarcar presença    🙁")
                    .foregroundColor(willGo ? .accentColor : .red)
            }
            
            Spacer()
        }
    }
    
}

struct PartyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PartyDetailsView()
    }
}
