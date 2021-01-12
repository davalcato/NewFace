//
//  LoginViewModel .swift
//  NewFace
//
//  Created by Daval Cato on 1/11/21.
//

import SwiftUI
import LocalAuthentication
import Firebase


class LoginViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    // For Alerts...
    @Published var alert = false
    @Published var alertMsg = ""
    
    // User Data...
    
    @AppStorage("stored_User") var Stored_User = ""
    
    @AppStorage("stored_Password") var Stored_Password = ""
    
    @AppStorage("status") var logged = false
    
    
    // Getting BioMetricType...
    func getBioMetricStatus()->Bool{
        
        let scanner = LAContex()
        if email == Stored_User &&
            scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none){
            
            return true
        }
        
        return false
    }
    
    // Authenticate User...
    
    func authenticateUser(){
        
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Unlock \(email)")
        { (status, err) in
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            
            // setting logged status as true...
            
        }
    }
    
}
