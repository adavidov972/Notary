//
//  Notary.swift
//  Notary
//
//  Created by Avi Davidov on 09/06/2019.
//  Copyright © 2019 Avi Davidov. All rights reserved.
//

import Foundation
import Firebase

let db = Firestore.firestore()

enum ApproeKind : String, Codable {
    
    case sign = "אימות חתימה"
    case will = "אישור צוואה"
    case translation = "אישור תרגום"
}

struct Notary : Codable {
    
    var indexNumber : Int
    var approvalDate : Date
    var approveKind : ApproeKind
    var clientName : String
    var price : Int
    
    init(indexNumber : Int, approvalDate : Date, approveKind : ApproeKind, clientName : String, price : Int) {
        
        self.indexNumber = indexNumber
        self.approvalDate = approvalDate
        self.approveKind = approveKind
        self.clientName = clientName
        self.price = price
    }
}


extension Notary {
    
    func getNotariesFromFirebase (complition : @escaping (Notary?, Error?) -> Void) {
        db.collection("Notary").getDocuments() { (querySnapshot, error) in
            if let error = error {
                complition(nil, error)
            } else {
                for document in querySnapshot!.documents {
                    guard let json = try? JSONSerialization.data(withJSONObject: document.data(), options: .init()) else {
                        return
                    }
                    let notary = try? JSONDecoder().decode(Notary.self, from: json)
                    print(notary!)
                }
            }
        }
    }
}
