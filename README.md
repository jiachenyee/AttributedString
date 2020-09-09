# AttributedString

A simple way to deal with NSAttributedStrings

![Demo App](Demo.png) 
```swift
// lyrics is just a String of the lyrics to Never Gonna Give You Up
let rickroll = lyrics

    // Converts the lyrics (String) to Attributed
    .attributed() 

    // Highlights "Never gonna" blue
    .highlight(usingRegex: "Never gonna", options: [], color: .systemBlue) 

    // Sets text color of "Never gonna" to system background
    .textColor(usingRegex: "Never gonna", options: [], color: .systemBackground) 

    // Sets anything within 2 brackets as italics 
    // E.g. (Hello) or (123)
    .italic(usingRegex: "\\((.)+\\)", options: [])

    // Makes everything between 0 and 23 bold
    // Basically the title
    .bold(in: 0...23)

// Set attributed text of a textView to the rickroll string generated
textView.attributedText = rickroll.attributedString
```

## Features
- [x] Easily set text as **bold**, _italics_ or _**both at the same time**_. 
- [x] Set text colors and highlight colors using ranges 
- [x] Use Regular Expressions to easily provide attributes to certain parts of a String
- [x] Easily underline words
- [x] Easily embed an image into the text

## To-Dos
- [ ] Add table support

## Installation
### Swift Package Manager
```swift
let package = Package(
    name: "MyApp",
    dependencies: [
        .Package(url: "https://github.com/jiachenyee/AttributedString.git", majorVersion: 1)
    ]
)
```

## Usage
> Result: _Never_ gonna give you up
```swift
let attributes = "Never gonna give you up"
    .attributed()
    .bold()
    .italic(in: 0...5)
```

### Creating an Attributed String
<details>
<summary><strong>Creating using String</strong></summary>

```swift
Attributed("Never gonna give you up")
"Never gonna give you up".attributed()
```
</details>

<details>
<summary><strong>Creating using an NSAttributedString</strong></summary>

```swift
let nsAttributedString = NSMutableAttributedString(string: "Never gonna let you down")

Attributed(nsAttributedString)
nsAttributedString.attributed()
```
</details>

<details>
<summary><strong>Creating using UIImage</strong></summary>

```swift
Attributed(UIImage(named: "Here's an image")!)

UIImage(named: "image").attributed()
```
</details>

<details>
<summary><strong>Creating using HTML/RTF/TXT files</strong></summary>

```swift
Attributed(usingData: htmlData, ofType: .html)

Attributed(usingData: rtfData, ofType: .rtf)

Attributed(usingData: htmlData, ofType: .html, characterEncoding: .utf16)
```
</details>

---

### Concatenating or Joining
<details>
<summary><strong>Concatenating multiple Strings together to create a String</strong></summary>

```swift
Attributed("Never gonna give you up", "Never gonna let you down", ...)

Attributed(["Never gonna give you up", "Never gonna let you down"])
```
</details>

<details>
<summary><strong>Concatenating multiple NSAttributedStrings together to create an AttributedString</strong></summary>

```swift
Attributed(nsAttributedString, nsAttributedString, ...)

Attributed([nsAttributedString, nsAttributedString])
```
</details>

<details>
<summary><strong>Concatenating multiple AttributedStrings together to create a larger AttributedString</strong></summary>

```swift
Attributed("Never gonna give you up") + Attributed("Never gonna let you down")

Attributed(.init("Never gonna give you up"), .init("Never gonna let you down"), ...)

Attributed([.init("Never gonna give you up"), .init("Never gonna let you down")])
```
</details>

---

### Converting from AttributedString
<details>
<summary><strong>to String</strong></summary>

```swift
.attributedString.string
```
</details>

<details>
<summary><strong>to NSAttributedString</strong></summary>

Important to set it as the text in a Label or TextView
```swift
.attributedString
```
</details>

---

### Adding Styles
#### Bold
<details>
<summary><strong>Make the whole string bold</strong></summary>

> Result: **Never gonna give you up**
```swift
.bold()
```
</details>

<details>
<summary><strong>Make a range of text bold</strong></summary>

> Result: **Never** gonna give you up
```swift
.bold(in: 0...5)
```
</details>

<details>
<summary><strong>Make a range of text bold using NSRange</strong></summary>

> Result: **Never** gonna give you up
```swift
.bold(in: NSRange(location: 0, length: 5))
```
</details>


<details>
<summary><strong>Make a range of text bold using Regular Expressions</strong></summary>
    
> Result: **1234**ABC
```swift
.bold(usingRegex: "[0-9]", options: [])
```
</details>

---
#### Italics
<details>
<summary><strong>Make the whole string italic</strong></summary>
    
> Result: *Never gonna give you up*
```swift
.italic()
```    
</details>

<details>
<summary><strong>Make a range of text italic</strong></summary>
    
> Result: *Never* gonna give you up
```swift
.italic(in: 0...5)
```    
</details>

<details>
<summary><strong>Make a range of text italic using NSRange</strong></summary>
    
> Result: *Never* gonna give you up
```swift
.italic(in: NSRange(location: 0, length: 5))
```    
</details>


<details>
<summary><strong>Make a range of text italic using Regular Expressions</strong></summary>
    
> Result: *1234*ABC
```swift
.italic(usingRegex: "[0-9]", options: [])
```    
</details>

---
#### Underline
<details>
<summary><strong>Make the whole string underlined</strong></summary>

```swift
.underline()
```
</details>

<details>
<summary><strong>Make a range of text underlined</strong></summary>
    
```swift
.underline(in: 0...5)
```
</details>

<details>
<summary><strong>Make a range of text underlined using NSRange</strong></summary>
    
```swift
.underline(in: NSRange(location: 0, length: 5))
```
</details>

<details>
<summary><strong>Make a range of text red underlined</strong></summary>
    
```swift
.underline(in: 0...5, color: .systemRed)
```
</details>


<details>
<summary><strong>Make a range of text red with single underlined style</strong></summary>
    
```swift
.underline(in: 0...5, color: .systemRed, style: .single)
```
</details>

<details>
<summary><strong>Make a range of text underlined using Regular Expressions</strong></summary>
    
```swift
.underline(usingRegex: "[0-9]", options: [], color: .systemRed, style: .single)
```
</details>

#### Text Colors
<details>
<summary><strong>Set a text color for the whole string</strong></summary>

```swift
.textColor(color: .systemRed)
```
</details>

<details>
<summary><strong>Set a text color for the specific range</strong></summary>

```swift
.textColor(in: 0...5, color: .systemRed)
```
</details>

<details>
<summary><strong>Set a text color for the specific range using NSRange</strong></summary>

```swift
.textColor(in: NSRange(location: 0, length: 5), color: .systemRed)
```
</details>

<details>
<summary><strong>Set a text color based on Regular Expression</strong></summary>

```swift
.textColor(usingRegex: "[0-9]", options: [], color: .systemRed)
```
</details>

#### Highlight Colors
<details>
<summary><strong>Set a highlight color for the whole string</strong></summary>

```swift
.highlight(with: .systemRed)
```
</details>

<details>
<summary><strong>Set a highlight color within a specific range</strong></summary>

```swift
.highlight(in: 0...5, with: .systemRed)
```
</details>

<details>
<summary><strong>Set a highlight color within a specific range using NSRange</strong></summary>

```swift
.highlight(in: NSRange(location: 0, length: 5), with: .systemRed)
```
</details>

<details>
<summary><strong>Set a highlight color based on Regular Expression</strong></summary>

```swift
.highlight(usingRegex: "[0-9]", options: [], color: .systemRed)
```
</details>

#### Custom Fonts
<details>
<summary><strong>Set a custom font for the whole string</strong></summary>

> Result: `Never gonna give you up`
```swift
.font(with: UIFont.monospacedSystemFont(ofSize: 20, weight: .regular))
```
</details>

<details>
<summary><strong>Set a custom font within a specific range</strong></summary>

> Result: `Never` gonna give you up
```swift
.font(in: 0...5, with: UIFont.monospacedSystemFont(ofSize: 20, weight: .regular))
```
</details>

<details>
<summary><strong>Set a custom font within a specific range using NSRange</strong></summary>

> Result: `Never` gonna give you up
```swift
.font(in: NSRange(location: 0, length: 5), with: UIFont.monospacedSystemFont(ofSize: 20, weight: .regular))
```
</details>

<details>
<summary><strong>Set a custom font based on Regular Expression</strong></summary>

> Result: `1234`ABCD`9`EF
```swift
.font(usingRegex: "[0-9]", options: [], selectedFont: UIFont.monospacedSystemFont(ofSize: 20, weight: .regular))
```
</details>

### Removing Styles
#### Bold
<details>
<summary><strong>Remove bold from the whole string</strong></summary>
    
```swift
.removeBold()
```
</details>

<details>
<summary><strong>Remove bold for a range of text</strong></summary>
    
```swift
.removeBold(in: 0...5)
```
</details>

<details>
<summary><strong>Remove bold from a range of text using NSRange</strong></summary>
    
```swift
.removeBold(in: NSRange(location: 0, length: 5))
```
</details>

<details>
<summary><strong>Remove bold using regular expressions</strong></summary>

```swift
.bold(usingRegex: "[0-9]", options: [])
```    
</details>

---
#### Italics
<details>
<summary><strong>Remove italic from the whole string</strong></summary>

```swift
.removeBold()
```
</details>

<details>
<summary><strong>Remove italic for a range of text</strong></summary>

```swift
.removeItalic(in: 0...5)
```
</details>

<details>
<summary><strong>Remove italic for a range of text using NSRange</strong></summary>

```swift
.removeItalic(in: NSRange(location: 0, length: 5))
```
</details>

<details>
<summary><strong>Remove italic using Regular Expressions</strong></summary>

```swift
.removeItalic(usingRegex: "[0-9]", options: [])
```
</details>


---
#### Underline
<details>
<summary><strong>Remove underline from the whole text</strong></summary>

```swift
.removeUnderline()
```
</details>

<details>
<summary><strong>Remove underline within a range </strong></summary>

```swift
.removeUnderline(in: 0...5)
```
</details>

<details>
<summary><strong>Remove underline within a range using NSRange</strong></summary>

```swift
.removeUnderline(in: NSRange(location: 0, length: 5))
```
</details>

<details>
<summary><strong>Remove underline using Regular Expressions</strong></summary>

```swift
.removeUnderline(usingRegex: "[0-9]", options: [], color: .systemRed, style: .single)
```
</details>
