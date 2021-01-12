//
//  Login_Face_IDApp.swift
//  NewFace
//
//  Created by Daval Cato on 1/11/21.
//

import SwiftUI
import Firebase

struct Login_Face_IDApp: App {
    
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate 
    
    var body: some View {
        WindowGroup {
            ContentView()
        }
    }
}

// Initializing Firebase...
class Delegate : NSObject, UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
    
    
}












