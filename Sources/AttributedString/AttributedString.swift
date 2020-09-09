#if canImport(UIKit)
import UIKit

#elseif canImport(AppKit)
import AppKit
#endif

extension String {
    func attributed() -> AttributedString {
        return AttributedString(self)
    }
}

extension NSAttributedString {
    func attributedString() -> AttributedString {
        let mutable = NSMutableAttributedString(attributedString: self)
        
        return AttributedString(mutable)
    }
}

class AttributedString {
    var attributedString: NSMutableAttributedString!
    
    private let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    
    #if canImport(UIKit)
    init(_ image: UIImage) {
        let textAttachment = NSTextAttachment(image: image)
        
        self.attributedString = NSMutableAttributedString(attachment: textAttachment)
    }
    
    #elseif canImport(AppKit)
    init(_ image: NSImage) {
        let textAttachment = NSTextAttachment(data: image.tiffRepresentation, ofType: "tiff")
        
        self.attributedString = NSMutableAttributedString(attachment: textAttachment)
    }
    #endif
    
    init(_ strings: AttributedString...) {
        let attributedString = NSMutableAttributedString()
        
        strings.forEach { (string) in
            attributedString.append(string.attributedString)
        }
        
        self.attributedString = attributedString
    }
    
    init(_ strings: NSMutableAttributedString...) {
        let attributedString = NSMutableAttributedString()
        
        strings.forEach { (string) in
            attributedString.append(string)
        }
        
        self.attributedString = attributedString
    }
    
    init(_ strings: String...) {
        let attributedString = NSMutableAttributedString()
        
        strings.forEach { (string) in
            attributedString.append(NSAttributedString(string: string,
                                                       attributes: [.font : defaultFont]))
        }
        
        self.attributedString = attributedString
    }
    
    static func +(lhs: AttributedString, rhs: AttributedString) -> AttributedString {
        let string = lhs.attributedString ?? NSMutableAttributedString()
        
        string.append(rhs.attributedString)
        
        return AttributedString(string)
    }
}
