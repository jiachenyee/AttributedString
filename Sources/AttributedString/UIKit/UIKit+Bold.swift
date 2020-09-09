//
//  UIKit+Bold.swift
//  
//
//  Created by JiaChen(: on 9/9/20.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension AttributedString {
    
    // MARK: - Bold
    
    /// Make text bold within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be bold
    /// - Returns: Attributed Strings
    func bold(in range: NSRange) -> AttributedString {
        attributedString.enumerateAttribute(.font, in: range, options: []) { (fontAttribute, range, _) in
            guard let fontAttribute = fontAttribute as? UIFont else { return }
            
            var traits = fontAttribute.fontDescriptor.symbolicTraits
            
            traits.insert(.traitBold)
            
            let descriptor = fontAttribute.fontDescriptor.withSymbolicTraits(traits)
            
            let newFont = UIFont(descriptor: descriptor!, size: 0)
            
            attributedString.addAttribute(.font, value: newFont, range: range)
        }
        
        return AttributedString(attributedString)
    }
    
    /// Make text bold within a specific range (using 1...9)
    /// - Parameter range: The range of text intended to be bold
    func bold(in range: ClosedRange<Int>) -> AttributedString {
        let length = range.upperBound - range.lowerBound
        let range = NSRange(location: range.lowerBound, length: length)
        
        return bold(in: range)
    }
    
    /// Make all text bold
    ///
    /// Make text bold for the full range of the text.
    func bold() -> AttributedString {
        return bold(in: 0...attributedString.length - 1)
    }
    
    func bold(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = bold(in: result.range)
        }
        
        return self
    }
    
    // MARK: - Removing Bold
    
    /// Make text bold within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be bold
    /// - Returns: Attributed Strings
    func removeBold(in range: NSRange) -> AttributedString {
        attributedString.enumerateAttribute(.font, in: range, options: []) { (fontAttribute, range, _) in
            guard let fontAttribute = fontAttribute as? UIFont else { return }
            
            var traits = fontAttribute.fontDescriptor.symbolicTraits
            
            if traits.contains(.traitBold) {
                traits.remove(.traitBold)
            }
            
            let descriptor = fontAttribute.fontDescriptor.withSymbolicTraits(traits)
            
            let newFont = UIFont(descriptor: descriptor!, size: 0)
            
            attributedString.addAttribute(.font, value: newFont, range: range)
        }
        
        return AttributedString(attributedString)
    }
    
    /// Make text bold within a specific range (using 1...9)
    /// - Parameter range: The range of text intended to be bold
    func removeBold(in range: ClosedRange<Int>) -> AttributedString {
        let length = range.upperBound - range.lowerBound
        let range = NSRange(location: range.lowerBound, length: length)
        
        return removeBold(in: range)
    }
    
    /// Make all text bold
    ///
    /// Make text bold for the full range of the text.
    func removeBold() -> AttributedString {
        return removeBold(in: 0...attributedString.length - 1)
    }
    
    func removeBold(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = removeBold(in: result.range)
        }
        
        return self
    }
}
#endif
