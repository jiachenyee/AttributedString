//
//  Attributes+UIKit.swift
//  
//
//  Created by JiaChen(: on 8/9/20.
//

import Foundation

#if canImport(UIKit)
import UIKit

extension AttributedString {
    
    // MARK: - Bold
    
    /// Make text bold within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be bold
    /// - Returns: Attributed Strings
    func bold(for range: NSRange) -> AttributedString {
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
    func bold(for range: ClosedRange<Int>) -> AttributedString {
        let length = range.upperBound - range.lowerBound
        let range = NSRange(location: range.lowerBound, length: length)
        
        return bold(for: range)
    }
    
    /// Make all text bold
    ///
    /// Make text bold for the full range of the text.
    func bold() -> AttributedString {
        return bold(for: 0...attributedString.length - 1)
    }
    
    func bold(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = bold(for: result.range)
        }
        
        return self
    }
    
    // MARK: - Removing Bold
    
    /// Make text bold within a specific range (using NSRange)
    /// - Parameter range: The range of text intended to be bold
    /// - Returns: Attributed Strings
    func removeBold(for range: NSRange) -> AttributedString {
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
    func removeBold(for range: ClosedRange<Int>) -> AttributedString {
        let length = range.upperBound - range.lowerBound
        let range = NSRange(location: range.lowerBound, length: length)
        
        return removeBold(for: range)
    }
    
    /// Make all text bold
    ///
    /// Make text bold for the full range of the text.
    func removeBold() -> AttributedString {
        return removeBold(for: 0...attributedString.length - 1)
    }
    
    func removeBold(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = removeBold(for: result.range)
        }
        
        return self
    }
    
    // MARK: - Italics
    func italic(for range: NSRange) -> AttributedString {
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
    func italic(for range: ClosedRange<Int>) -> AttributedString {
        let length = range.upperBound - range.lowerBound
        let range = NSRange(location: range.lowerBound, length: length)
        
        return italic(for: range)
    }
    
    /// Make all text bold
    ///
    /// Make text bold for the full range of the text.
    func italic() -> AttributedString {
        return italic(for: 0...attributedString.length - 1)
    }
    
    func italic(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = italic(for: result.range)
        }
        
        return self
    }
    
    // MARK: - Removing Italics
    /// Remove italic for the whole string
    /// - Parameter range: The range of text intended to be italic
    func removeItalic(for range: NSRange) -> AttributedString {
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
    func removeItalic(for range: ClosedRange<Int>) -> AttributedString {
        let length = range.upperBound - range.lowerBound
        let range = NSRange(location: range.lowerBound, length: length)
        
        return removeItalic(for: range)
    }
    
    /// Make all text bold
    ///
    /// Make text bold for the full range of the text.
    func removeItalic() -> AttributedString {
        return removeItalic(for: 0...attributedString.length - 1)
    }
    
    func removeItalic(usingRegex pattern: String, options: NSRegularExpression.Options) throws -> AttributedString {
        let regex = try NSRegularExpression(pattern: pattern, options: options)
        let matches = regex.matches(in: attributedString.string,
                                    options: [],
                                    range: NSRange(location: 0, length: attributedString.length))
        
        matches.forEach { (result) in
            _ = removeItalic(for: result.range)
        }
        
        return self
    }
    
    // MARK: - Underline
    /// Make text underline within a specific range
    /// - Parameter range: The range of text intended to be underlined
    func underline(withRange range: ClosedRange<Int>) {
        
    }
    
    func underline() {
        
    }
    
    func underline(_ color: UIColor, withRange range: ClosedRange<Int>) {
        
    }
    
    func underline(_ color: UIColor) {
        
    }
    
    func font(_ font: UIFont, withRange range: ClosedRange<Int>) {
        
    }
    
    func font(_ font: UIFont) {
        
    }
    
    func textColor(_ color: UIColor, withRange range: ClosedRange<Int>) {
        
    }
    
    func textColor(_ color: UIColor) {
        
    }
    
    func backgroundColor(_ color: UIColor, withRange range: ClosedRange<Int>) {
        
    }
    
    func backgroundColor(_ color: UIColor) {
        
    }
}
#endif
