# AttributedString

A simple way to deal with NSAttributedStrings

## Features
✅ Easily set text as **bold**, _italics_ or _**both at the same time**_.

## To-Dos
❌ Add text color support

❌ Add background color support

❌ Add font support

❌ Add table support

## Installation

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
AttributedString("Never gonna give you up")
"Never gonna give you up".attributed()
```
</details>

<details>
<summary><strong>Creating using an NSAttributedString</strong></summary>

```swift
let nsAttributedString = NSMutableAttributedString(string: "Never gonna let you down")

AttributedString(nsAttributedString)
nsAttributedString.attributed()
```
</details>

---

### Concatenating or Joining
<details>
<summary><strong>Concatenating multiple Strings together to create a String</strong></summary>

```swift
AttributedString("Never gonna give you up", "Never gonna let you down", ...)

AttributedString(["Never gonna give you up", "Never gonna let you down"])
```
</details>

<details>
<summary><strong>Concatenating multiple NSAttributedStrings together to create an AttributedString</strong></summary>

```swift
AttributedString(nsAttributedString, nsAttributedString, ...)

AttributedString([nsAttributedString, nsAttributedString])
```
</details>

<details>
<summary><strong>Concatenating multiple AttributedStrings together to create a larger AttributedString</strong></summary>

```swift
AttributedString("Never gonna give you up") + AttributedString("Never gonna let you down")

AttributedString(.init("Never gonna give you up"), .init("Never gonna let you down"), ...)

AttributedString([.init("Never gonna give you up"), .init("Never gonna let you down")])
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
