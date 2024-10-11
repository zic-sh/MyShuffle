// The Swift Programming Language
// https://docs.swift.org/swift-book


#if os(Linux)
import Glibc
#else
import Darwin.C
#endif

public extension MutableCollection where Index == Int {
    mutating func shuffle() {
        if count <= 1 { return }

        for i in 0..<count - 1 {
          #if os(Linux)
            let j = Int(random() % (count - i)) + i
          #else
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
          #endif
            swapAt(i, j)
        }
    }
}

