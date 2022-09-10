//
//  SwiftClosureTask.swift
//  
//
//  Created by Leif on 9/10/22.
//

public struct SwiftClosureTask: RobotTask {
    private let closure: () async throws -> Void
    
    public init(_ closure: @escaping () async throws -> Void) {
        self.closure = closure
    }
    
    public func run() async throws {
        try await closure()
    }
}
