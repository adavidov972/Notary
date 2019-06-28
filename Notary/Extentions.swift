//
//  Extentions.swift
//  Notary
//
//  Created by Avi Davidov on 09/06/2019.
//  Copyright © 2019 Avi Davidov. All rights reserved.
//

import Foundation
import Firebase


extension QuerySnapshot {
    
    func decodedItem <T : Codable> () throws -> T? {
        
        
        for document in self.documents {
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: document.data(), options: []) {
                if let item = try? JSONDecoder().decode(T.self, from: jsonData) {
                    return item
                }

            }
        }
        return nil
    }
}
