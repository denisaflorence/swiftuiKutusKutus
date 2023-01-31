//
//  LoginView.swift
//  HelloCoreData
//
//  Created by Denisa on 16/01/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username:String = ""
    @State private var password:String = ""
    var body: some View {
        //        NavigationView{
        VStack(spacing:20){
            Text("Selamat Datang")
                .bold()
//                    Spacer()
            Text("Username")
            TextField("Masukkan username anda", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Password")
            TextField("Masukkan password anda", text: $password).textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login"){
                
            }
            Spacer()
            
        }
    }
//    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
