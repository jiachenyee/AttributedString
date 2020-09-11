//
//  ViewController.swift
//  AttributedStrings
//
//  Created by JiaChen(: on 8/9/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sampleCode: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let attributes = try! """
Never Gonna Give You Up
We're no strangers to love

You know the rules and so do I
A full commitment's what I'm thinking of
You wouldn't get this from any other guy
I just wanna tell you how I'm feeling

Gotta make you understand

Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye

Never gonna tell a lie and hurt you
We've known each other for so long
Your heart's been aching but
You're too shy to say it

Inside we both know what's been going on

We know the game and we're gonna play it
And if you ask me how I'm feeling
Don't tell me you're too blind to see
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you

Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you

Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
(Ooh, give you up)
(Ooh, give you up)
(Ooh)
Never gonna give, never gonna give
(Give you up)(Ooh)
Never gonna give, never gonna give(Give you up)
We've know each other for so long
Your heart's been aching but
You're too shy to say it
Inside we both know what's been going on

We know the game and we're gonna play it
I just wanna tell you how I'm feeling
Gotta make you understand
Never gonna give you up

Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
"""
            .attributed()
            .highlight(usingRegex: "Never gonna", options: [], color: .systemBlue)
            .textColor(usingRegex: "Never gonna", options: [], color: .systemBackground)
            .italic(usingRegex: "\\((.)+\\)", options: [])
            .bold(in: 0...23)
        
        textView.attributedText = attributes.attributedString
        
        let sampleCodeString = try! """
        // Converts the lyrics (String) to Attributed
        .attributed()

        // Highlights "Never gonna" blue
        .highlight(usingRegex: "Never gonna",
                   options: [],
                   color: .systemBlue)

        // Sets text color of "Never gonna" to system background
        .textColor(usingRegex: "Never gonna",
                   options: [],
                   color: .systemBackground)

        // Sets anything within 2 brackets as italics
        // E.g. (Hello) or (123)
        .italic(usingRegex: "\\((.)+\\)",
                options: [])

        // Makes everything between 0 and 23 bold
        // Basically the title
        .bold(in: 0...23)
        """
            .attributed()
            .font(with: UIFont.monospacedSystemFont(ofSize: UIFont.systemFontSize, weight: .regular))
            .textColor(color: .label)
            .textColor(usingRegex: "//.+", options: [], color: .systemGray2)
            .textColor(usingRegex: "\\\".+\\\"", options: [], color: .systemRed)
        
        sampleCode.attributedText = sampleCodeString.attributedString
    }
}
