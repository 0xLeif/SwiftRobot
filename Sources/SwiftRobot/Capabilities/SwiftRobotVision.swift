//
//  SwiftRobotVision.swift
//  
//
//  Created by Leif on 9/10/22.
//

import CoreGraphics
import Vision

public struct SwiftRobotVision: RobotVisionCapable {
    public func textObservations(
        in image: CGImage,
        options: [VNImageOption: Any] = [:]
    ) async throws -> [VNRecognizedTextObservation] {
        try await vision.text(in: image, options: options)
    }
}
