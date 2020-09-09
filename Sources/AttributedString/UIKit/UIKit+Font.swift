//
//  UIKit+Font.swift
//  
//
//  Created by JiaChen(: on 9/9/20.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension AttributedString {
    // MARK: - Fonts
    
    /// Make text underlined within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be underlined
    /// - Returns: Attributed Strings
    func font(in range: NSRange,
              with font: UIFont) -> AttributedString {
        
        attributedString.addAttribute(.font, value: font, range: range)
        
        return AttributedString(attributedString)
    }
    
    /// Make text bold within a specific range (using 1...9)
    /// - Parameter range: The range of text intended to be bold
    func font(in range: ClosedRange<Int>? = nil,
              with selectedFont: UIFont) -> AttributedString {
        
        let range = range ?? 0...attributedString.length
        let length = range.upperBound - range.lowerBound
        let nsRange = NSRange(location: range.lowerBound, length: length)
        
        return font(in: nsRange, with: selectedFont)
    }
    
    func defaultFont(in range: ClosedRange<Int>? = nil) -> AttributedString {
        let range = range ?? 0...attributedString.length
        let length = range.upperBound - range.lowerBound
        let nsRange = NSRange(location: range.lowerBound, length: length)
        
        return font(in: nsRange, with: defaultFont)
    }
    
    func font(usingRegex pattern: String,
              options: NSRegularExpression.Options,
              selectedFont: UIFont,
              range: ClosedRange<Int>? = nil) throws -> AttributedString {
        
        let range = range ?? 0...attributedString.length
        let length = range.upperBound - range.lowerBound
        let nsRange = NSRange(location: range.lowerBound, length: length)
        
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: nsRange)
        
        matches.forEach { (result) in
            _ = font(in: result.range, with: selectedFont)
        }
        
        return self
    }
}
#endif
