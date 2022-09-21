//
//  ScreenLocation.swift
//  
//
//  Created by Ahmed Shendy on 17/09/2022.
//

import Foundation

/// A component capable of converting mouse enum points to CGPoint
public enum ScreenLocation: RobotScreenCapable {
    case center
    
    case point(CGPoint)
    
    /// Convert enum points to CGPoint
    func toPoint(
        displayID: CGDirectDisplayID = CGMainDisplayID()
    ) async -> CGPoint {
        switch self {
        case .center:
            return await screen.center(display: displayID)
            
        case .point(let point):
            return point
        }
    }
}
