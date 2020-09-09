//
//  File.swift
//  
//
//  Created by JiaChen(: on 9/9/20.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension AttributedString {
    // MARK: - Underline
    
    /// Make text underlined within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be underlined
    /// - Returns: Attributed Strings
    func underline(in range: NSRange,
                   color: UIColor = .label,
                   style: NSUnderlineStyle = .single) -> AttributedString {
        
        attributedString.addAttribute(.underlineStyle, value: style.rawValue, range: range)
        attributedString.addAttribute(.underlineColor, value: color, range: range)
        
        return AttributedString(attributedString)
    }
    
    /// Make text bold within a specific range (using 1...9)
    /// - Parameter range: The range of text intended to be bold
    func underline(in range: ClosedRange<Int>? = nil,
                   color: UIColor = .label,
                   style: NSUnderlineStyle = .single) -> AttributedString {
        
        let range = range ?? 0...attributedString.length
        let length = range.upperBound - range.lowerBound
        let nsRange = NSRange(location: range.lowerBound, length: length)
        
        return underline(in: nsRange, color: color, style: style)
    }
    
    func underline(usingRegex pattern: String,
                   options: NSRegularExpression.Options,
                   color: UIColor = .label,
                   style: NSUnderlineStyle = .single) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = underline(in: result.range, color: color, style: style)
        }
        
        return self
    }
    
    // MARK: - Removing Bold
    
    /// Make text bold within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be bold
    /// - Returns: Attributed Strings
    func removeUnderline(in range: NSRange) -> AttributedString {
        attributedString.removeAttribute(.underlineStyle, range: range)
        attributedString.removeAttribute(.underlineColor, range: range)
        
        return AttributedString(attributedString)
    }
    
    /// Make text bold within a specific range (using 1...9)
    /// - Parameter range: The range of text intended to be bold
    func removeUnderline(in range: ClosedRange<Int>? = nil) -> AttributedString {
        let range = range ?? 0...attributedString.length
        
        let nsRange = NSRange(location: range.lowerBound,
                              length: range.upperBound - range.lowerBound)
        
        return removeUnderline(in: nsRange)
    }
        
    func removeUnderline(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = removeUnderline(in: result.range)
        }
        
        return self
    }
}
#endif
