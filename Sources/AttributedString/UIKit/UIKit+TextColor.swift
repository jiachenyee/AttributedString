//
//  UIKit+TextColor.swift
//  
//
//  Created by JiaChen(: on 9/9/20.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension AttributedString {
    // MARK: - Text Color
    
    /// Make text underlined within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be underlined
    /// - Returns: Attributed Strings
    func textColor(in range: NSRange,
                   color: UIColor = .label) -> AttributedString {
        
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        
        return AttributedString(attributedString)
    }
    
    /// Make text bold within a specific range (using 1...9)
    /// - Parameter range: The range of text intended to be bold
    func textColor(in range: ClosedRange<Int>? = nil,
                   color: UIColor = .label) -> AttributedString {
        
        let range = range ?? 0...attributedString.length
        let length = range.upperBound - range.lowerBound
        let nsRange = NSRange(location: range.lowerBound, length: length)
        
        return textColor(in: nsRange, color: color)
    }
    
    func textColor(usingRegex pattern: String,
                   options: NSRegularExpression.Options,
                   color: UIColor = .label,
                   range: ClosedRange<Int>? = nil) throws -> AttributedString {
        
        let range = range ?? 0...attributedString.length
        let length = range.upperBound - range.lowerBound
        let nsRange = NSRange(location: range.lowerBound, length: length)
        
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: nsRange)
        
        matches.forEach { (result) in
            _ = textColor(in: result.range, color: color)
        }
        
        return self
    }
}
#endif
