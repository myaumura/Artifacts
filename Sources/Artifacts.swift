// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct Artifacts: ParsableCommand {
    mutating func run() throws {
        try move(x: 1, y: 2)
    }
}
