import XCTest
@testable import SwiftRobot

final class SwiftRobotTests: XCTestCase {
    func testExample() async throws {
        try await RobotTaskGroup {
            
            MoveMouse(to: .point(.init(x: 0, y: 0)))
            
            MonitorMouse(.start)
            
            await RobotTaskGroup {
                TypeKey(.e)
                TypeCapitalKey(.f)
            }
            
        }
        .run()
    }
}
