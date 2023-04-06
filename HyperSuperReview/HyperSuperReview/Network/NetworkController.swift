//
//  NetworkController.swift
//  HyperSuperReview
//
//  Created by Arda Çimen on 6.04.2023.
//

import Foundation
import FirebaseAuth
import Firebase
import Alamofire

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
    
    
    func fetchPost(completion: @escaping (Result<[Posts], Error>) -> Void){
        
        let url = "http://www.hypersuperprojects.com/wp-json/wp/v2/posts?per_page=100"
        let headers: HTTPHeaders = [
            "content-type": "application/json",
        ]
        
        
        
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers, interceptor: nil)
            .validate()
            .responseDecodable(of: [Posts].self) { response in
                let result = response.result.mapError { $0 as Error }
                completion(result)
            }
        
    }
    
    func takeImgUrl(id : Int, completion: @escaping (String) -> Void) {
        
        
        
        let postId = id
        
        guard let postUrl = URL(string: "http://hypersuperprojects.com/wp-json/wp/v2/posts/\(postId)") else {
            return
            
        }
        
        URLSession.shared.dataTask(with: postUrl) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let featuredMediaId = json["featured_media"] as? Int,
                   let mediaUrl = URL(string: "http://hypersuperprojects.com/wp-json/wp/v2/media/\(featuredMediaId)")
                {
                    URLSession.shared.dataTask(with: mediaUrl) { (data, response, error) in
                        guard let data = data else {
                            print("Error retrieving media data: \(error?.localizedDescription ?? "Unknown error")")
                            return
                        }
                        
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                               let mediaUrlString = json["source_url"] as? String,
                               let mediaUrl = URL(string: mediaUrlString)
                            {
                                completion(mediaUrl.absoluteString)
                            }
                        } catch {
                            print("Error parsing media JSON: \(error.localizedDescription)")
                        }
                    }.resume()
                }
            } catch {
                print("Error parsing post JSON: \(error.localizedDescription)")
            }
        }.resume()
        
    }
    
    
    func resetPassword(mail: String , completion: @escaping (Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: mail){error in
            completion(error)
        }
    }
    
    func changePassword(password: String , completion: @escaping (Error?) -> Void) {
        Auth.auth().currentUser?.updatePassword(to: password){error in
            completion(error)
        }
    }
    
    
    func saveCommentWhenClickSave(mail: String, review: String, film : String,  completion: @escaping (Error?) -> Void) {
        
        db.collection("reviews").document().setData([
            "mail" : mail ,
            "film" : film,
            "review" : review,
            "status" : false
        ]) { err in
            completion(err)
        }
        
    }
    
    func saveRequest(mail: String, request: String,  completion: @escaping (Error?) -> Void) {
        
        db.collection("reviews").document().setData([
            "mail" : mail ,
            "name" : request,
        ]) { err in
            completion(err)
        }
        
    }
    
    func changeInfo(name: String,  completion: @escaping (Error?) -> Void) {
        
        db.collection("users").document(Auth.auth().currentUser?.email ?? "No User").setData([
            "name" : name,
            "mail" : Auth.auth().currentUser?.email as Any
        ]) { err in
            completion(err)
        }
        
    }
    
    
    func getDataForInfo(completion: @escaping (String?, String?) -> Void) {
        let docRef = db.collection("users").document(Auth.auth().currentUser!.email!)

        docRef.getDocument { (document, error) in
            if let document = document {
                if let allData = document.data() {
                    if let name = allData["name"] as? String, let mail = allData["mail"] as? String {
                        completion(name,mail)
                    } else {
                        completion(nil,nil)
                    }
                } else {
                    completion(nil,nil)
                }
            } else {
                print("Error getting document: \(error)")
                completion(nil,nil)
            }
        }
    }

    
 
    
    
    enum ReviewsResult {
        case success(status: [Bool], review: [String], film: [String], mail: [String])
        case failure(Error)
    }

    func getReviews(completionHandler: @escaping (ReviewsResult) -> Void) {
        let collectionRef = db.collection("reviews")

        var status = [Bool]()
        var review = [String]()
        var film = [String]()
        var mail = [String]()

        collectionRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                completionHandler(.failure(error))
                return
            }

            guard let querySnapshot = querySnapshot else {
                print("No documents found.")
                let error = NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "No documents found."])
                completionHandler(.failure(error))
                return
            }

            for document in querySnapshot.documents {
                let allData = document.data()
                mail.append(allData["mail"] as? String ?? "")
                status.append(allData["status"] as? Bool ?? false)
                film.append(allData["film"] as? String ?? "")
                review.append(allData["review"] as? String ?? "")
            }

            completionHandler(.success(status: status, review: review, film: film, mail: mail))
        }
    }


    
    
}
