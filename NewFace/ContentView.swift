//
//  ContentView.swift
//  NewFace
//
//  Created by Daval Cato on 1/9/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("status") var logged = false
    var body: some View {
        
        NavigationView{
            
            if logged{
                
                Text("User Logged In....")
                    .navigationTitle("Home")
                    .navigationBarHidden(false)
                    .preferredColorScheme(.light)
            }
            else{
                
                Login()
                    .preferredColorScheme(.dark)
                    .navigationBarHidden(true)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var userName = ""
    @State var password = ""
    
    // When first time user logged in via email store this for future biometric login..
    @AppStorage("stored_User") var user = "STORED_EMAIL_ID"
    @AppStorage("status") var logged = false
    
    var body: some View{
        
        
        VStack{
            
            Spacer(minLength: 0)
            
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
    
    
}
