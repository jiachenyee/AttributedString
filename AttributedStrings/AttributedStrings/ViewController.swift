//
//  ViewController.swift
//  AttributedStrings
//
//  Created by JiaChen(: on 8/9/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let attr = try! "HAHAAHA"
            .attributed()
            .bold(usingRegex: "A", options: [])
            .italic(for: 0...3)
            .removeItalic(usingRegex: "A", options: [])
            .removeBold(for: 3...5)
        
        textView.attributedText = attr.attributedString
        
    }
}
