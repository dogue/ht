## Installation

Install with nimble:
`nimble install https://github.com/dogue/ht`

## Usage

```nim
import ht

let mySequence = @[1, 2, 3, 4, 5]
(head, tail) <- mySequence
echo head, ", ", tail
# 1, @[2, 3, 4, 5]
```

## Notes

The `<-` only works with right hand types of `array`, `openArray`, or `sequence`. Any other type will throw a compiler error.

Attempting to destructure an empty collection will raise an `IndexDefect` exception.
