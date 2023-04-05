//
//  NetworkController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 6.04.2023.
//

import Foundation
import FirebaseAuth
import Firebase

class NetworkController
{
    let db = Firestore.firestore()
    static let shared = NetworkController()
    
    func register(mail: String, password: String, name: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: mail, password: password) { authData, error in
            completion(error)
        }
    }
    
    
    func saveDataWhenClickRegister(mail: String, name: String, completion: @escaping (Error?) -> Void) {
       
        db.collection("users").document(Auth.auth().currentUser?.email ?? "No User").setData([
                   "mail" : mail ,
                   "name" : name,
               ]) { err in
                  completion(err)
               }
        
    }
    
    func login(mail: String, password: String,  completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: mail, password: password){ authData, error in
            completion(error)
        }
    }
    
    
}
