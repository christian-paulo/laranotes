//
//  Report.swift
//  LaraNotes
//
//  Created by Christian Paulo on 16/05/22.
//

import Foundation

struct Report {
    
    //private var releases: [Release] = [] // Usado na View
    private var dict: [String : [Release]] = [:]
    
    var reportsByDate: [(date: String, releases: [Release])] {
        self.dict
            .map { key, value in
                return (date: key, releases: value)
            }
            //.map { (date: $0, releases: $1) }
            .sorted { a, b in
                a.releases[0].date > b.releases[0].date
            }
    }
    
    var calculate: Double {
        var wallet = 0.0
        
        let releases = dict.values.reduce(into: []) { $0.append(contentsOf: $1) }
        
        for release in releases {
            if release.type == .ganho {
                wallet += release.value
            }
        }
        
        for release in releases {
            if release.type == .despesa{
                wallet -= release.value
            }
        }
        return wallet
    }
    
    mutating func add(release: Release) {
        
        let formmatter = DateFormatter()
        formmatter.locale = Locale(identifier: "pt_BR")
        formmatter.dateFormat = "dd/MM/yyyy"
        let dateBr = formmatter.string(from: release.date)
        
        if let unwrappedArray = dict[dateBr]{
            dict[dateBr] = unwrappedArray + [release]
        } else {
            dict[dateBr] = [release]
        }
    }
    
}

extension Report {
    
    // Singleton TODO: pesquisar sobre quando usar e quando nao usar
    static var api: Report = Report(
        //        releases: [
        //            Release(title: "Cabelo", type: .despesa, value: 25, date: Date()),
        //            Release(title: "Salário", type: .ganho, value: 1500, date: Date().advanced(by: 60 * 60 * 24)),
        //            Release(title: "Jantar", type: .despesa, value: 50, date: Date()),
        //            Release(title: "Comidinhas", type: .despesa, value: 140, date: Date()),
        //        ]
//        dict: [
//            "18/05/2022": [
//                Release(title: "Cabelo", type: .despesa, value: 25, date: Date()),
//                Release(title: "Jantar", type: .despesa, value: 50, date: Date()),
//                Release(title: "Comidinhas", type: .despesa, value: 140, date: Date()),
//            ],
//            "19/05/2022": [
//                Release(title: "Salário", type: .ganho, value: 1500, date: Date().advanced(by: 60 * 60 * 24)),
//            ],
//            "20/05/2022": [
//                Release(title: "Pamonha", type: .despesa, value: 10, date: Date().advanced(by: 60 * 60 * 24 * 2)),
//            ]
//        ]
    )
    
    //    func callAddInArray() {
    //        releases.forEach { add(release: $0) }
    //    }
}
