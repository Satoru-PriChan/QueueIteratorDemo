import UIKit

var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
print(queue.peek() ?? "n.a.")
print(queue.dequeue() ?? "n.a.")

queue.enqueue(3)

for item in queue {
    print(item)
}
