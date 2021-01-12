//
//  LoginViewModel .swift
//  NewFace
//
//  Created by Daval Cato on 1/11/21.
//

import SwiftUI

class LoginViewModel : ObservedObject{
    
    @Published var email = ""
    @Published var password = ""
    
    
    // For Alerts...
    @Published var alert = false
    @Published var alertMsg = ""
    
    
}
