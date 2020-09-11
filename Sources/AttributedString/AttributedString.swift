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
    let defaultBoldFont = UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)
    
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
    
    enum TableErrors: Error {
        case insufficientElements
        case insufficientRows
    }
    
    init(table: [[String]], hasHeaderRow: Bool = true, width: CGFloat = 100, hasBorders: Bool = true, color: UIColor = .label) throws {
        var tableHTML = "<table style=\"width:\(width)%\">"
        
        if table.count == 0 {
            throw TableErrors.insufficientRows
        }
        
        let headerElements = table.first?.count
        
        if headerElements == 0 {
            throw TableErrors.insufficientElements
        }
        
        if hasBorders {
            tableHTML = "<head><style> table, th, td { border: 1px solid \(colorToHex(color)); border-collapse: collapse; } </style></head><body>" + tableHTML
        }
        
        var mutableTable = table
        
        if hasHeaderRow {
            tableHTML += "<tr>"
            mutableTable[0].forEach {
                tableHTML += "<th>\($0)</th>"
            }
            tableHTML += "</tr>"
            
            mutableTable.removeFirst()
        }
        
        mutableTable.forEach {
            tableHTML += "<tr>"
            
            $0.forEach {
                tableHTML += "<td>\($0)</td>"
            }
            
            tableHTML += "</tr>"
        }
        
        tableHTML += "</table>"
        
        let attr = try NSMutableAttributedString(data: Data(tableHTML.utf8),
                                                 options: [.documentType: NSAttributedString.DocumentType.html,
                                                           .characterEncoding: Int(String.Encoding.utf8.rawValue)],
                                                 documentAttributes: nil)
        
        attr.addAttribute(.font, value: defaultFont, range: NSRange(location: 0, length: attr.length))
        
        if hasHeaderRow {
            let length: Int = {
                let firstRow = table.first!
                var lengthTotal = 0
                
                firstRow.forEach {
                    lengthTotal += $0.count
                    print(lengthTotal)
                }

                return lengthTotal
            }()
            
            attr.addAttribute(.font, value: defaultBoldFont, range: NSRange(location: 0, length: length + headerElements! - 1))
        }
        
        attributedString = attr
    }
    
    private func colorToHex(_ color: UIColor) -> String {
        return color.htmlRGBColor
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

extension UIColor {
    var rgbComponents:(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (r,g,b,a)
        }
        
        return (0,0,0,0)
    }
    
    var htmlRGBColor:String {
        return String(format: "#%02x%02x%02x", Int(rgbComponents.red * 255), Int(rgbComponents.green * 255),Int(rgbComponents.blue * 255))
    }
}
