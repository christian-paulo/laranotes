//
//  Report.swift
//  LaraNotes
//
//  Created by Christian Paulo on 13/05/22.
//

import Foundation

struct Release : Identifiable{
    var id = UUID()
    var title : String
    var type : Flavor
    var value : Double
    var date : Date
}

enum Flavor: String, CaseIterable, Identifiable {
    case despesa, ganho
    var id: Self { self }
}
