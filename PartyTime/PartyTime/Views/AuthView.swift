//
//  LoginView.swift
//  PartyTime
//
//  Created by Carlos Amaral on 12/02/22.
//

import SwiftUI

struct AuthView: View {
    
    @AppStorage("wantToSignUp") var wantToSignUp : Bool = false
    
    var body: some View {
        ZStack {
            Image("LoginImage")
                .resizable()
                .scaledToFill()
                .colorMultiply(Color.secondary)
                .edgesIgnoringSafeArea(.top)
                
            
            VStack {
                if wantToSignUp {
                    SignUpForm()
                } else {
                    SignInForm()
                }
            }
            .frame(width: UIScreen.maxWidth)
        }
    }
}

struct SignInForm : View {
    @State private var email : String = ""
    @State private var password : String = ""
    
    @AppStorage("wantToSignUp") var wantToSignUp : Bool = false
    @AppStorage("isLogged") var isLogged : Bool = false
    
    @Environment(\.managedObjectContext) var db
    
    var body: some View {
        VStack {
            TextField("Qual é o seu e-mail?", text: $email)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding(.horizontal)
            
            SecureField("E a sua senha?", text: $password)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding(.horizontal)
            
            HStack {
                Button {
                    self.wantToSignUp.toggle()
                } label: {
                    Text("Criar conta")
                }
                
                Spacer()
                
                Button {
                    self.isLogged.toggle()
                } label: {
                    Text("Entrar!")
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(.indigo)
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            .padding()
        }
    }
}

struct SignUpForm : View {
    
    @State private var nameField : String = ""
    @State private var usernameField : String = ""
    @State private var emailField : String = ""
    @State private var publicProfileField : Bool = true
    @State private var passwordField : String = ""
    
    @AppStorage("wantToSignUp") var wantToSignUp : Bool = false
    
    @Environment(\.managedObjectContext) var db
    
    func SignUpFunc() {
        var user = UserModel()
        user.name = self.nameField
        user.username = self.usernameField
        user.email = self.emailField
        user.publicProfile = self.publicProfileField
        user.password = self.passwordField
        user.deleteAccount = false
        user.localization = false
        user.phone = ""
        
        try? db.save()
    }
    
    var body: some View {
        VStack {
            TextField("Qual é o seu nome?", text: $nameField)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding(.horizontal)
            
            TextField("Crie o seu incrível nome de usuário", text: $usernameField)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding(.horizontal)
            
            TextField("Qual e-mail você quer vincular no app?", text: $emailField)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding(.horizontal)
            
            Toggle(isOn: $publicProfileField) {
                Text(publicProfileField ? "Seu perfil é público" : "Seu perfil é privado")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.3))
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(5)
            .padding(.horizontal)
            
            SecureField("Crie uma senha segura", text: $passwordField)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(5)
                .padding(.horizontal)
            
            
            HStack {
                Button {
                    self.wantToSignUp.toggle()
                } label: {
                    Text("Já tenho conta")
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Criar conta!")
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background(.indigo)
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
