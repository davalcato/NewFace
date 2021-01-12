//
//  Login.swift
//  NewFace
//
//  Created by Daval Cato on 1/11/21.
//

import SwiftUI

struct Login : View {
    
    @StateObject var LoginModel = LoginViewModel()
    // When first time user logged in via email store this for future biometric login..
    @AppStorage("stored_User") var user = "STORED_EMAIL_ID"
    @AppStorage("status") var logged = false
    
    var body: some View{
        
        
        VStack{
            
            Spacer(minLength: 0)
            
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // Dynamic Frame...
                .padding(.horizontal,35)
                .padding(.vertical)
            
            HStack{
                
                VStack(alignment: .leading, spacing: 12, content: {
                    
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Please sign in to continue")
                        .foregroundColor(Color.white)
                })
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.leading,15)
            
            HStack{
                
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                Text("EMAIL", text: $LoginModel.email)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white.opacity(LoginModel.email == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            
            HStack{
                
                Image(systemName: "Lock")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 35)
                
                SecureField("PASSWORD", text: $LoginModel.password)
                    .autocapitalization(.none)
            }
            .padding()
            .background(Color.white.opacity(LoginModel.password == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            HStack(spacing: 15){
                
                Button(action: {}, label: {
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("green"))
                        .clipShape(Capsule())
                })
                .opacity(LoginModel.email != "" && LoginModel.password != "" ? 1 : 0.05)
                .disabled(LoginModel.email != "" && LoginModel.password != "" ? false : true)
                
                if getBioMetricStatus(){
                    
                    Button(action: authenticateUser, label: {
                        
                        // Getting biometrictype...
                        Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color("green"))
                            .clipShape(Circle())
                    })
                }
            }
            
            // Forgot Button...
            
            Button(action: {}, label: {
                Text("Forget password?")
                    .foregroundColor(Color("green"))
            })
            .padding(.top,8)
            
            // SignUp...
            
            Spacer(minLength: 0)
            
            HStack(spacing: 5){
                
                Text("Don't have an account")
                
            }
        }
    }
    
}















