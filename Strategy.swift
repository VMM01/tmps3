//
//  Strategy.swift
//  Struc+Behavior
//
//  Created by Vadim Mocan on 3/4/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import Foundation

protocol PrintReportStrategy {
    func print(_ string: String) -> String
}

final class ReportPrinter {
    
    private let strategy: PrintReportStrategy
    
    func print(_ string: String) -> String {
        return self.strategy.print(string)
    }
    
    init(strategy: PrintReportStrategy) {
        self.strategy = strategy
    }
}

final class UpperCaseStrategy: PrintReportStrategy {
    func print(_ string: String) -> String {
        return string.uppercased()
    }
}

final class LowerCaseStrategy: PrintReportStrategy {
    func print(_ string:String) -> String {
        return string.lowercased()
    }
}
