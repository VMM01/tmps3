//
//  Template+PlainReport.swift
//  Struc+Behavior
//
//  Created by Vadim Mocan on 3/1/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import Foundation

class PlainTextReport: Report {
    
    override func outputStart() {}
    
    override func outputHead() {
        print("==========\(title)==========")
        self.fullText += "==========\(title)==========\n"
        print()
    }
    
    override func outputBodyStart() {}
    
    override func outputLine(_ line: String) {
        print("\(line)")
        self.fullText += "\(line)"
    }
    
    override func outputBodyEnd() {}
    
    override func outputEnd() {}
}
