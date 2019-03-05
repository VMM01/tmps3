//
//  ViewController.swift
//  Struc+Behavior
//
//  Created by Vadim Mocan on 3/1/19.
//  Copyright © 2019 MidnightWorks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var prepareButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    let htmlReport: HTMLReport = HTMLReport(title: "This is a a HTML report",
                                          text: ["reporting item number 1",
                                                 "reporting item number 2",
                                                 "reporting item number 3",
                                                 "reporting item number 4"])
    let plainTextReport = PlainTextReport(title: "This is a plain report",
                                          text: ["reporting item number 1",
                                                 "reporting item number 2",
                                                 "reporting item number 3",
                                                 "reporting item number 4"])
    override func viewDidLoad() {
        super.viewDidLoad()
        htmlReport.outputReport()
        plainTextReport.outputReport()
        //MEMENTO
        if let htmlReport = UserDefaults.standard.object(forKey: "htmlReport") as? String {
            textLabel.text = htmlReport
        }
        let string = htmlReport.fullText
        textLabel.text = string
        //MEMENTO
        UserDefaults.standard.set(string, forKey: "htmlReport")
        
        //ITERRATOR
        let reports = Reports.init(reports: [htmlReport,plainTextReport])
        for report in reports {
            print(report)
        }
        
        //STRATEGY
        let upper = ReportPrinter(strategy: UpperCaseStrategy())
        let upperReport = upper.print(htmlReport.fullText)
        print(upperReport)
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:  htmlReport.prepareForReview()
        case 1:  htmlReport.submitForReview()
        case 2:  htmlReport.publish()
        default: htmlReport.prepareForReview()
        }
    }
}

