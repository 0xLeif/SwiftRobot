//
//  SwiftRobotVision.swift
//  
//
//  Created by Leif on 9/10/22.
//

import CoreGraphics
import Vision

/// A component capable of using RobotVision to perform a variety of tasks on input images and video using [Vision](https://developer.apple.com/documentation/vision)
public struct SwiftRobotVision: RobotVisionCapable {
    
    /// Get the text in the provided image
    public func textObservations(
        in image: CGImage,
        options: [VNImageOption: Any] = [:]
    ) async throws -> [VNRecognizedTextObservation] {
        try await vision.text(in: image, options: options)
    }
}
