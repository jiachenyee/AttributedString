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
#### Creating AttributedString using String
```swift
AttributedString("Never gonna give you up")
"Never gonna give you up".attributed()
```

#### Creating using an NSAttributedString
```swift
let nsAttributedString = NSMutableAttributedString(string: "Never gonna let you down")

AttributedString(nsAttributedString)
nsAttributedString.attributed()
```

---

### Concatenating or Joining
#### Concatenating multiple Strings together to create a String
```swift
AttributedString("Never gonna give you up", "Never gonna let you down", ...)

AttributedString(["Never gonna give you up", "Never gonna let you down"])
```

#### Concatenating multiple NSAttributedStrings together to create an AttributedString
```swift
AttributedString(nsAttributedString, nsAttributedString, ...)

AttributedString([nsAttributedString, nsAttributedString])
```

#### Concatenating multiple AttributedStrings together to create a larger AttributedString
```swift
AttributedString("Never gonna give you up") + AttributedString("Never gonna let you down")

AttributedString(.init("Never gonna give you up"), .init("Never gonna let you down"), ...)

AttributedString([.init("Never gonna give you up"), .init("Never gonna let you down")])
```
---

### Converting AttributedString to NSAttributedString
Important to set it as the text in a Label or TextView
```swift
AttributedString("Never gonna give you up").attributedString
```
---

### Adding Styles
#### Bold
Make the whole string bold
> Result: **Never gonna give you up**
```swift
AttributedString("Never gonna give you up")
    .bold()
```


Make a range of text bold
> Result: **Never** gonna give you up
```swift
AttributedString("Never gonna give you up")
    .bold(in: 0...5)
```


Make a range of text bold using NSRange
> Result: **Never** gonna give you up
```swift
AttributedString("Never gonna give you up")
    .bold(in: NSRange(location: 0, length: 5))
```


Make a range of text bold using Regular Expressions
> Result: **1234**ABC
```swift
AttributedString("1234ABC")
    .bold(usingRegex: "[0-9]", options: [])
```

---
#### Italics
Make the whole string italic
> Result: *Never gonna give you up*
```swift
AttributedString("Never gonna give you up")
    .italic()
```


Make a range of text italic
> Result: *Never* gonna give you up
```swift
AttributedString("Never gonna give you up")
    .italic(in: 0...5)
```


Make a range of text italic using NSRange
> Result: *Never* gonna give you up
```swift
AttributedString("Never gonna give you up")
    .italic(in: NSRange(location: 0, length: 5))
```


Make a range of text italic using Regular Expressions
> Result: *1234*ABC
```swift
AttributedString("1234ABC")
    .italic(usingRegex: "[0-9]", options: [])
```

---
#### Underline
Make the whole string underlined
```swift
AttributedString("Never gonna give you up")
    .underline()
```


Make a range of text underlined
```swift
AttributedString("Never gonna give you up")
    .underline(in: 0...5)
```


Make a range of text underlined using NSRange
```swift
AttributedString("Never gonna give you up")
    .underline(in: NSRange(location: 0, length: 5))
```

Make a range of text red underlined
```swift
AttributedString("Never gonna give you up")
    .underline(in: 0...5, color: .systemRed)
```

Make a range of text red with single underlined style
```swift
AttributedString("Never gonna give you up")
    .underline(in: 0...5, color: .systemRed, style: .single)
```

Make a range of text underlined using Regular Expressions
```swift
AttributedString("1234ABC")
    .underline(usingRegex: "[0-9]", options: [], color: .systemRed, style: .single)
```
