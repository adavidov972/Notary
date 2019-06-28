//
//  NotaryListViewModel.swift
//  Notary
//
//  Created by Avi Davidov on 09/06/2019.
//  Copyright © 2019 Avi Davidov. All rights reserved.
//

import Foundation

struct NotaryListViewModels {
    private var notaries : [Notary]
    
    var numberOfSections : Int {
        return 1
    }
    
    func numberOfRowsInSection (_ section : Int) -> Int {
        return self.notaries.count
    }
    
    func notaryAtIndex (_ index : Int) -> NotaryViewModel {
        let notary = notaries [index]
        return NotaryViewModel(notary)
    }
    
    
    
}

struct NotaryViewModel {

    private let notary : Notary
    
    var indexNumber : Int {
        return notary.indexNumber
    }
    
    var price : Int {
        return notary.price
    }
    
    var clientName : String {
        return notary.clientName
    }
    
    var approeKind : String {
        return notary.approveKind.rawValue
    }
    
    var approvalDate : Date {
        return notary.approvalDate
    }
    
    
}

extension NotaryViewModel {
    
    init(_ notary : Notary) {
        self.notary = notary
    }
}

