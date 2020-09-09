//
//  File.swift
//  
//
//  Created by JiaChen(: on 9/9/20.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension Attributed {
    // MARK: - Text Color
    
    /// Make text underlined within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be underlined
    /// - Returns: Attributed Strings
    func highlight(in range: NSRange,
                   with color: UIColor) -> Attributed {
        
        attributedString.addAttribute(.backgroundColor, value: color, range: range)
        
        return Attributed(attributedString)
    }
    
    /// Make text bold within a specific range (using 1...9)
    /// - Parameter range: The range of text intended to be bold
    func highlight(in range: ClosedRange<Int>? = nil,
                   with color: UIColor = .label) -> Attributed {
        
        let range = range ?? 0...attributedString.length
        let length = range.upperBound - range.lowerBound
        let nsRange = NSRange(location: range.lowerBound, length: length)
        
        return highlight(in: nsRange, with: color)
    }
    
    func highlight(usingRegex pattern: String,
                   options: NSRegularExpression.Options,
                   color: UIColor = .label,
                   range: ClosedRange<Int>? = nil) throws -> Attributed {
        
        let range = range ?? 0...attributedString.length
        let length = range.upperBound - range.lowerBound
        let nsRange = NSRange(location: range.lowerBound, length: length)
        
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: nsRange)
        
        matches.forEach { (result) in
            _ = highlight(in: result.range, with: color)
        }
        
        return self
    }
}
#endif
