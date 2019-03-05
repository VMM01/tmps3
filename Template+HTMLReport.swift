//
//  Template+HTMLReport.swift
//  Struc+Behavior
//
//  Created by Vadim Mocan on 3/1/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import Foundation

class HTMLReport: Report {
    
    override func outputStart() {
        print("<html>")
        self.fullText += "<html>\n"
    }
    
    override func outputHead() {
        print("<head>")
        self.fullText += "<head>\n"
        print("     <title>\(title)</title>")
        self.fullText += "     <title>\(title)</title>\n"
        print("</head>")
        self.fullText += "</head>\n"
    }
    
    override func outputBodyStart() {
        print("<body>")
        self.fullText += "<body>\n"
    }
    
    override func outputLine(_ line: String) {
        print("     <p>\(line)</p>")
        self.fullText += "     <p>\(line)</p>\n"
    }
    
    override func outputBodyEnd() {
        print("</body>")
        self.fullText += "</body>\n"
    }
    
    override func outputEnd() {
        print("</html>")
        self.fullText += "</html>"
    }
}
