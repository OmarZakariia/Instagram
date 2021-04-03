//
//  AuthManager.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager() // one single instance of the class
    
    //MARK: - Public
    // Add public APIs or public functions that anyone in the app could use
    public func registerNewUser(username: String, email:String, password:String, completion:@escaping (Bool)-> Void){
        /*
         - Check if username is available
         - Check if email is available
         
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username){ canCreate in
            if canCreate {
//                - Create account
//                - Inser account to database
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard  error == nil, result != nil else {
                        //Firebase auth could not create an account
                        completion(false)
                        return
                    }
                    // insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted{
                            completion(true)
                            return
                        }
                        else {
                            // Failed to insert into database
                            completion(false)
                            return
                        }
                    }
                }
                
            }
            else {
                // either username or email does not exist
                completion(false)
            }
        }
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping(Bool)->Void){
        if let email = email{
            // email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            // username logged in
            print(username)
         
        }
    }
}

