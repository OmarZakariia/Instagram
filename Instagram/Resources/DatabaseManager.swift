//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager() // one single instance of the class
    
    // Reference to the database
    private let database = Database.database().reference()
    
    //MARK: - Public
   // Functions that login or AuthManager gonna use
    
    /// These docs strings comments pop up in autoComplete
    
    /// Check if username and email is available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: @escaping((Bool) -> Void) ){
        completion(true )
    }
    /// Insert new user into the database
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Async call for result if database entry succeede
    
    public func insertNewUser(with email: String, username: String, completion: @escaping(Bool)-> Void){
        // to use the database
        let key = email.safeDatabaseKey()
        
        database.child(key).setValue(["username",username]) {error, _  in
            if error == nil{
            // succeeded
                completion(true)
                 
            }
            else {
             // failed
                completion(false)
                return
            }
        }
        
    }
}
