//
//  UserProfileView.swift
//  PartyTime
//
//  Created by Carlos Amaral on 12/02/22.
//

import SwiftUI

struct UserProfileView: View {
    
    @State var username : String = "Username"
    @State var name : String = "Nome"
    @State var email : String = "Email"
    @State var phone : String = "Telefone"
    @State var localization : Bool = false
    @State var publicProfile : Bool = false
    
    @State var deleteAccount : Bool = false
    @State var deleteAccountToggle : Bool = false
    
    @AppStorage("wantToSignUp") var wantToSignUp : Bool = false
    @AppStorage("isLogged") var isLogged : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        
                        Section(header: Text("Informações pessoais")) {
                            Text(self.name)
                            Text(self.email)
                            Text(self.phone)
                        }
                        
                        Section(header: Text("Permissões")) {
                            Toggle(isOn: $localization) {
                                Text("Localização")
                            }
                            
                            Toggle(isOn: $publicProfile) {
                                Text("Perfil público")
                            }
                        }
                        
                        Section(header: Text("Área de risco!")) {
                            Button {
                                self.wantToSignUp = false
                                self.isLogged = false
                            } label: {
                                Text("Sair da conta")
                                    .foregroundColor(.red)
                            }

                            Button {
                                
                            } label: {
                                Text("Deletar conta")
                                    .foregroundColor(.red)
                            }
                        }
                        
                    }
                    .listStyle(.inset)
                }
            }
            .navigationTitle("@\(self.username)")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
