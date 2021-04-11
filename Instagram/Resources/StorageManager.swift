//
//  StorageManager.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import FirebaseStorage





public class StorageManager {
    //MARK:- Structs and Enums
    
    // Creating my own error
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    
    
    //MARK:- Variables and Constants
    static let shared = StorageManager() // one single instance of the class
    
    private let bucket = Storage.storage().reference()
    
    //MARK: - Public
    // Function for our entire app can use
    public func uploadUserPost(model: UserPost, completion: @escaping (Result<URL, Error>)-> Void){
        
    }
    
    public func downloadImage(with reference: String, completion: @escaping (Result<URL,IGStorageManagerError>) -> Void){
        bucket.child(reference).downloadURL { (url, error) in
            guard let url = url, error == nil else{
                completion(.failure(.failedToDownload))
                return
            }
            completion(.success(url))
        }
    }
    
}


