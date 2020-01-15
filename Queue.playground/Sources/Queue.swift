import Foundation

private final class Node<T> {
    var key: T?
    var next: Node?
    
    init(_ value: T? = nil) {
        self.key = value
    }
}

public final class Queue<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public init(){}
    
    ///Function to add a new element at the last of the queue.
    public func enqueue(_ value: T) {
        let newNode = Node<T>(value)
        
        guard let _ = self.head else {
            //The first element has not been set.
            self.head = newNode
            self.tail = self.head
            return
        }
        
        //The first element has already been set.
        self.tail?.next = newNode
        self.tail = newNode
    }
    
    public func dequeue() -> T? {
        //先頭にものがない場合はnilを返す
        guard let headItem = self.head?.key else {
            return nil
        }
        
        //先頭を付け替える
        if let nextNode = self.head?.next {
            self.head? = nextNode
        } else {
            self.head = nil
            self.tail = nil
        }
        
        //先頭を返す
        return headItem
    }
    
    public func isEmpty() -> Bool {
        return head == nil
    }
    
    //Get head item without throwing it away.
    public func peek() -> T? {
        return self.head?.key
    }
}
