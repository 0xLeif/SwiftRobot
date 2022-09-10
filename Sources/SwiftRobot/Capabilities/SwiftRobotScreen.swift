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
        await capability.bounds(display: display)
    }
    
    public func center(
        display: CGDirectDisplayID = CGMainDisplayID()
    ) async -> CGPoint {
        await capability.center(display: display)
    }
}
