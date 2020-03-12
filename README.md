# Queue implementation in Swift

Generic queue implementation in Swift programming language.

```swift
protocol Queueable {
    associatedtype Element

    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    func peek() -> Element?
    func isEmpty() -> Bool
}
```

# Usage

See [test](https://github.com/lukabratos/Queue/blob/master/Queue.playground/Contents.swift#L33).
