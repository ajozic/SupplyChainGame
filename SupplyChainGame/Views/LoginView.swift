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
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
                VStack(spacing: CGFloat(verticalPaddingForForm)) {
                    Text("Welcome To Supply Chain Game")
                        .font(.title)
                        .foregroundColor(Color.white)
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.secondary)
                        TextField("Enter your name", text: $name)
                            .foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    HStack {
                        Image("icons8-key-50")
                            .resizable()
                            .frame(width: 16.0, height: 16.0) .foregroundColor(.secondary)
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
                    
                }.padding(.horizontal, CGFloat(verticalPaddingForForm))
                
            }.navigationBarBackButtonHidden(true)
        }
}
}
