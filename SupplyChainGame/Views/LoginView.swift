//
//  LoginView.swift
//  SupplyChainGame
//
//  Created by Adam Jozic on 02.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var name: String = ""
    @State private var password: String = ""
    @State var email = ""
    @State var alertMessage = "Something went wrong!"
    @State var showAlert = false
    //@EnvironmentObject var userAuth: UserAuth
    @StateObject var userAuth = UserAuth()
    
    let verticalPaddingForForm = 40.0

    var body: some View {
        NavigationView{
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: CGFloat(verticalPaddingForForm)) {
                Image("beer").resizable().frame(width: 200, height: 200)
                Text("Welcome To Supply Chain Game")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Enter your name", text: $name)
                        .foregroundColor(Color.black)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 3)
                    SecureField("Enter password", text: $password)
                        .foregroundColor(Color.black)
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)

                Button(action: {
                    userAuth.login(email: name, password: password)
                    userAuth.isLoggedin.toggle()
                    
                    
                } ) {
                        NavigationLink("Login",destination: Dashboard().navigationBarBackButtonHidden(true).navigationBarHidden(true)
                                       // .navigationBarTitle(Text("Home"))
                                        .edgesIgnoringSafeArea([.top, .bottom]))
                            .padding()
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Spacer()
            }.padding(.horizontal, CGFloat(verticalPaddingForForm)).background(Color.blue)
            
        }
        
    }
    }
}
