//
//  AuthManager.swift
//  Instagram
//
//  Created by Dipen Chauhan on 5/31/22.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String) {
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
            if let email = email {
                // email log in
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    guard authResult != nil, error != nil else {
                        completion(false)
                        return
                    }
                    completion(true)
                }
            }
            else if let username = username {
                // username log in
                print(username)
            }
            
        }
}
