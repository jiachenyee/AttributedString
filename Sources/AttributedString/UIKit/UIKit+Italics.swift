//
//  UIKit+Italics.swift
//  
//
//  Created by JiaChen(: on 9/9/20.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension AttributedString {
    
    // MARK: - Italics
    
    func italic(in range: NSRange) -> AttributedString {
        attributedString.enumerateAttribute(.font, in: range, options: []) { (fontAttribute, range, _) in
            guard let fontAttribute = fontAttribute as? UIFont else { return }
            
            var traits = fontAttribute.fontDescriptor.symbolicTraits
            
            traits.insert(.traitItalic)
            
            let descriptor = fontAttribute.fontDescriptor.withSymbolicTraits(traits)
            
            let newFont = UIFont(descriptor: descriptor!, size: 0)
            
            attributedString.addAttribute(.font, value: newFont, range: range)
        }
        
        return AttributedString(attributedString)
    }
    
    /// Make text italic within a specific range
    /// - Parameter range: The range of text intended to be italic
    func italic(in range: ClosedRange<Int>) -> AttributedString {
        let length = range.upperBound - range.lowerBound
        let range = NSRange(location: range.lowerBound, length: length)
        
        return italic(in: range)
    }
    
    /// Make all text bold
    ///
    /// Make text bold for the full range of the text.
    func italic() -> AttributedString {
        return italic(in: 0...attributedString.length - 1)
    }
    
    func italic(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = italic(in: result.range)
        }
        
        return self
    }
    
    // MARK: - Removing Italics
    /// Remove italic for the whole string
    /// - Parameter range: The range of text intended to be italic
    func removeItalic(in range: NSRange) -> AttributedString {
        attributedString.enumerateAttribute(.font, in: range, options: []) { (fontAttribute, range, _) in
            guard let fontAttribute = fontAttribute as? UIFont else { return }
            
            var traits = fontAttribute.fontDescriptor.symbolicTraits
            
            if traits.contains(.traitItalic) {
                traits.remove(.traitItalic)
            }
            
            let descriptor = fontAttribute.fontDescriptor.withSymbolicTraits(traits)
            
            let newFont = UIFont(descriptor: descriptor!, size: 0)
            
            attributedString.addAttribute(.font, value: newFont, range: range)
        }
        
        return AttributedString(attributedString)
    }
    
    /// Make text italic within a specific range
    /// - Parameter range: The range of text intended to be italic
    func removeItalic(in range: ClosedRange<Int>) -> AttributedString {
        let length = range.upperBound - range.lowerBound
        let range = NSRange(location: range.lowerBound, length: length)
        
        return removeItalic(in: range)
    }
    
    /// Make all text bold
    ///
    /// Make text bold for the full range of the text.
    func removeItalic() -> AttributedString {
        return removeItalic(in: 0...attributedString.length - 1)
    }
    
    func removeItalic(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = removeItalic(in: result.range)
        }
        
        return self
    }
}
#endif
