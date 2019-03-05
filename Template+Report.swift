//
//  Template.swift
//  Struc+Behavior
//
//  Created by Vadim Mocan on 3/1/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

//TEMPLATE + STATE PATTERN

import Foundation

struct Reports {
    let reports: [Report]
}

struct ReportsIterrator: IteratorProtocol {
    
    private var current = 0
    private let reports: [Report]
    
    init(reports: [Report]) {
        self.reports = reports
    }
    
    mutating func next() -> Report? {
        defer { current += 1 }
        return reports.count > current ? reports[current] : nil
    }
}

extension Reports: Sequence {
    func makeIterator() -> ReportsIterrator {
        return ReportsIterrator(reports: reports)
    }
}

class Report {
    
    enum ReportState {
        case raw
        case submitted
        case published
    }
    
    let title: String
    let text:  [String]
    var state: ReportState?
    var fullText: String
    
    init(title: String, text: [String]) {
        self.title = title
        self.text = text
        self.fullText = ""
    }
    
    func outputReport() {
        outputStart()
        outputHead()
        outputBodyStart()
        outputBody()
        outputBodyEnd()
        outputEnd()
    }
    
    func prepareForReview() {
        if self.state == nil {
            self.state = ReportState.raw
            print("Added to review")
        } else {
            print("ERROR. Already started")
        }
    }
    
    func submitForReview() {
        if self.state == ReportState.raw {
            self.state = ReportState.submitted
            print("Successfully submitted")
        } else {
            print("ERROR. Already submitted")
        }
    }
    
    func publish() {
        if self.state == ReportState.submitted {
            self.state = ReportState.published
            print("Successfully published")
        } else {
            print("ERROR. Already submitted")
        }
    }
    
    internal func outputStart() {
        preconditionFailure("this method needs to be overriden by concrete subscasses")
    }
    
    internal func outputHead() {
        preconditionFailure("this method needs to be overriden by concrete subscasses")
    }
    
    internal func outputBodyStart() {
        preconditionFailure("this method needs to be overriden by concrete subscasses")
    }
    
    private func outputBody() {
        text.forEach { (line) in
            outputLine(line)
        }
    }
    
    internal func outputLine(_ line: String) {
        preconditionFailure("this method needs to be overriden by concrete subscasses")
    }
    
    internal func outputBodyEnd() {
        preconditionFailure("this method needs to be overriden by concrete subscasses")
    }
    
    internal func outputEnd() {
        preconditionFailure("this method needs to be overriden by concrete subscasses")
    }
}
