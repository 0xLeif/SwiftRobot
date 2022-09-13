//
//  RobotMouseCapable.swift
//  
//
//  Created by Leif on 9/10/22.
//

import RobotKit
import CoreGraphics

protocol RobotMouseCapable { }
extension RobotMouseCapable {
    var mouse: RobotMouse {
        get async {
            await Robot.default.mouse
        }
    }
}

//protocol RobotMouseScreenCapable { }
//extension RobotMouseScreenCapable {
//    var capability: MoveMouseCapability {
//        MoveMouseCapability.default
//    }
//}
//
//struct MoveMouseCapability {
//    static let `default`: MoveMouseCapability = MoveMouseCapability()
//
//    private var mouse: RobotMouse {
//        get async {
//            await Robot.default.mouse
//        }
//    }
//
//    private var screen: RobotScreen {
//        get async {
//            await Robot.default.screen
//        }
//    }
//
//    func move(to: CGPoint) async {
//        await mouse.move(to: to)
//    }
//}
