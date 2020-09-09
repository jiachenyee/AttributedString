#if canImport(UIKit)
import UIKit

#elseif canImport(AppKit)
import AppKit
#endif

extension String {
    func attributed() -> Attributed {
        return Attributed(self)
    }
}

extension NSAttributedString {
    func attributed() -> Attributed {
        let mutable = NSMutableAttributedString(attributedString: self)
        
        return Attributed(mutable)
    }
}

extension UIImage {
    func attributed() -> Attributed {
        return Attributed(self)
    }
}

class Attributed {
    var attributedString: NSMutableAttributedString!
    
    let defaultFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    
    #if canImport(UIKit)
    init(_ image: UIImage, customSize: CGSize? = nil) {
        let textAttachment = NSTextAttachment(image: {
            if let newSize = customSize {
                return image.resizeImage(newSize)
            }
            return image
        }())
        
        self.attributedString = NSMutableAttributedString(attachment: textAttachment)
    }
    
    #elseif canImport(AppKit)
    init(_ image: NSImage) {
        let textAttachment = NSTextAttachment(data: image.tiffRepresentation, ofType: "tiff")
        
        self.attributedString = NSMutableAttributedString(attachment: textAttachment)
    }
    #endif
    
    init(_ strings: Attributed...) {
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
    
    init(usingData data: Data,
         ofType type: NSAttributedString.DocumentType,
         characterEncoding: String.Encoding? = nil) throws {
        
        var options: [NSAttributedString.DocumentReadingOptionKey: Any] = [:]
        
        options.updateValue(type, forKey: .documentType)
        
        if let characterEncoding = characterEncoding {
            options.updateValue(Int(characterEncoding.rawValue), forKey: .characterEncoding)
        }
        
        self.attributedString = try NSMutableAttributedString(data: data,
                                                              options: options,
                                                              documentAttributes: nil)
    }
    
    static func +(lhs: Attributed, rhs: Attributed) -> Attributed {
        let string = lhs.attributedString ?? NSMutableAttributedString()
        
        string.append(rhs.attributedString)
        
        return Attributed(string)
    }
}

extension UIImage {
    func resizeImage(_ newSize: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint.zero, size: newSize)
        
        UIGraphicsBeginImageContext(newSize)
        self.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
