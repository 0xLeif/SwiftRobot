//
//  SwiftRobotScreen.swift
//  
//
//  Created by Leif on 9/10/22.
//

import CoreGraphics

/// A component capable of using RobotScreen to get information of the screen
public struct SwiftRobotScreen: RobotScreenCapable {
    /// Get the bounds of the display
    public func bounds(
        display: CGDirectDisplayID = CGMainDisplayID()
    ) async -> CGRect {
        await screen.bounds(display: display)
    }
    
    /// Get the center point of the bounds of the display
    public func center(
        display: CGDirectDisplayID = CGMainDisplayID()
    ) async -> CGPoint {
        await screen.center(display: display)
    }
    
    /// Create an image of the display for a certain CGRect
    public func image(
        display: CGDirectDisplayID = CGMainDisplayID(),
        rect: CGRect
    ) async -> CGImage? {
        await screen.image(display: display, rect: rect)
    }
}
