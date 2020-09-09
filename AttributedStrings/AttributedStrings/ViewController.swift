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
        
        textView.attributedText = attributes.attributedString
        
    }
}
