import Foundation
import XCTest

protocol Queueable {
    associatedtype Element
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    func peek() -> Element?
    func isEmpty() -> Bool
}

struct Queue<Element>: Queueable {
    private var arr: [Element] = [Element]()
    
    mutating func enqueue(_ element: Element) {
        arr.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return arr.isEmpty ? nil : arr.removeFirst()
    }
    
    func peek() -> Element? {
        return arr.first
    }
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
}

class QueueTests: XCTestCase {
    var queue: Queue<Int>!

    override func setUp() {
        super.setUp()
        queue = Queue<Int>()
    }

    func testQueue() {
        XCTAssertNotNil(queue)
        queue.enqueue(1)
        XCTAssertNotNil(queue.isEmpty())
        let element = queue.dequeue()
        XCTAssertTrue(queue.isEmpty())
        XCTAssertEqual(element, 1)
        XCTAssertNil(queue.peek())
    }
    
    func testQueueWithManyElements() {
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        queue.enqueue(4)
        XCTAssertEqual(queue.peek(), 1)
        queue.dequeue()
        queue.dequeue()
        let element = queue.dequeue()
        XCTAssertEqual(element, 3)
        queue.dequeue()
        XCTAssertTrue(queue.isEmpty())
        XCTAssertNil(queue.peek())
    }
    
    override func tearDown() {
        super.tearDown()
        queue = nil
    }
}

QueueTests.defaultTestSuite.run()
