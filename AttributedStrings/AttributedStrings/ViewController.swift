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
        
        let attributes = "Never gonna give you up"
            .attributed()
            .bold()
            .italic(in: 0...5)
            .textColor(in: 0...5, color: .systemRed)
            .highlight(in: 6...11, with: .cyan)
        
        textView.attributedText = attributes.attributedString
        
    }
}
