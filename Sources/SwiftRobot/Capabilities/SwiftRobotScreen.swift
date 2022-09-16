//
//  SwiftRobotScreen.swift
//  
//
//  Created by Leif on 9/10/22.
//

import CoreGraphics

public struct SwiftRobotScreen: RobotScreenCapable {
    public func bounds(
        display: CGDirectDisplayID = CGMainDisplayID()
    ) async -> CGRect {
        await screen.bounds(display: display)
    }
    
    public func center(
        display: CGDirectDisplayID = CGMainDisplayID()
    ) async -> CGPoint {
        await screen.center(display: display)
    }
    
    public func image(
        display: CGDirectDisplayID = CGMainDisplayID(),
        rect: CGRect
    ) async -> CGImage? {
        await screen.image(display: display, rect: rect)
    }
}
