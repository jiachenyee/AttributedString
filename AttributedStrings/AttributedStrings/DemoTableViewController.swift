//
//  DemoTableViewController.swift
//  AttributedStrings
//
//  Created by JiaChen(: on 10/9/20.
//

import UIKit

class DemoTableViewController: UIViewController {

    @IBOutlet weak var codeDemo: UITextView!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let table = try! Attributed(table: [["never", "gonna", "give", "you", "up"],
                                            ["never", "gonna", "let", "you", "down"],
                                            ["never", "gonna", "run", "around", "and", "desert", "you"],
                                            ["Never", "gonna", "make", "you", "cry"],
                                            ["Never", "gonna", "say", "goodbye"],
                                            ["Never", "gonna", "tell", "a", "lie", "and", "hurt", "you"]],
                                    hasHeaderRow: false,
                                    hasBorders: true,
                                    color: .systemBlue)
        
        textView.attributedText = table.attributedString
        
        let sampleCodeString = try! """
        // Creating a table using a 2D array [[String]]
        Attributed(table: [["never", "gonna", "give", "you", "up"],
                           ["never", "gonna", "let", "you", "down"],
                           ["never", "gonna", "run", "around", "and", "desert", "you"],
                           ["never", "gonna", "make", "you", "cry"],
                           ["never", "gonna", "say", "goodbye"],
                           ["never", "gonna", "tell", "a", "lie", "and", "hurt", "you"]],

                   // Removing header rows
                   hasHeaderRow: false,

                   // Turning on table borders
                   hasBorders: true,
                   
                   // Setting border color to blue
                   color: .systemBlue)
        """
            .attributed()
            .font(with: UIFont.monospacedSystemFont(ofSize: UIFont.systemFontSize, weight: .regular))
            .textColor(color: .label)
            .textColor(usingRegex: "//.+", options: [], color: .systemGray2)
            .textColor(usingRegex: "\\\".+\\\"", options: [], color: .systemRed)
        
        codeDemo.attributedText = sampleCodeString.attributedString
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
