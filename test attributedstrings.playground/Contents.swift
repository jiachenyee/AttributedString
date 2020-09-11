//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import CoreText

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
//        let paragraphStyle = NSParagraphStyle()
//        let textBlock = paragraphStyle.value(forKey: "textBlocks") as! NSArray
//
//        paragraphStyle.setValue(NSArray(), forKey: "textBlocks")
        
        let table = NSObject() //NSTextTable()
        table.setValue(2, forKey: "numberOfColumns")

        func makeCell(row: Int, column: Int, text: String) -> NSMutableAttributedString {
            let textBlock = NSObject()
            textBlock.setValue(table, forKey: "table")
            
            textBlock.setValue(row, forKey: "startingRow")
            textBlock.setValue(1, forKey: "rowSpan")
            textBlock.setValue(column, forKey: "startingColumn")
            textBlock.setValue(1, forKey: "columnSpan")
                
            //NSTextTableBlock(table: table, startingRow: row, rowSpan: 1, startingColumn: column, columnSpan: 1)

//            textBlock.setWidth(4.0, type: 0, for: NSTextBlock.Layer.border)
//            textBlock.setBorderColor(.blue)

            let paragraph = NSMutableParagraphStyle()
            paragraph.setValue([textBlock], forKey: "textBlocks")

            let cell = NSMutableAttributedString(string: text + "\n", attributes: [.paragraphStyle: paragraph])

            return cell
        }
        
        let content = NSMutableAttributedString(string: "some text")
        content.append(NSAttributedString(string: "\n")) // this newline is required in case content is not empty.

        //If you append table cells to some text without newline, the first row might not show properly.
        content.append(makeCell(row: 0, column: 0, text: "c00"))
        content.append(makeCell(row: 0, column: 1, text: "c 0 1"))
        content.append(makeCell(row: 1, column: 0, text: "c 1 0"))
        content.append(makeCell(row: 1, column: 1, text: "c11"))
        
        label.attributedText = content
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
