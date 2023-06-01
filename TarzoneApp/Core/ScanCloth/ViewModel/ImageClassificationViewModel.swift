//
//  ImageClassificationViewModel.swift
//  TarzoneApp
//
//  Created by Rabia Abdioğlu on 29.05.2023.
//

import Foundation
import CoreML
import SwiftUI

class ImageClassification {
    
        @Published var uiImage: UIImage?

        guard let pixelBuffer = uiImage!.toCVPixelBuffer(targetSize: CGSize(width: 224, height: 224)) else { return }

        do {
            let result = try imageClassifier?.prediction(my_input: pixelBuffer)

            if let predictionsArray = result?.var_362 {
                var maxIndex = 0
                var maxValue = Double.leastNormalMagnitude

                let count = predictionsArray.count

                for i in 0..<count {
                    let value = predictionsArray[i].doubleValue
                    if value > maxValue {
                        maxValue = value
                        maxIndex = i
                    }
                }
                print(maxIndex)
}
        } catch {
            print("Prediction error: \(error)")
        
        
    }
}

extension UIImage {
    func toCVPixelBuffer(targetSize: CGSize) -> CVPixelBuffer? {
        let attrs = [
            kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue,
            kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue
        ] as CFDictionary
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         Int(targetSize.width),
                                         Int(targetSize.height),
                                         kCVPixelFormatType_32ARGB,
                                         attrs,
                                         &pixelBuffer)
        guard status == kCVReturnSuccess, let imageBuffer = pixelBuffer else {
            return nil
        }

        CVPixelBufferLockBaseAddress(imageBuffer, [])
        let pixelData = CVPixelBufferGetBaseAddress(imageBuffer)
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        guard let context = CGContext(data: pixelData,
                                      width: Int(targetSize.width),
                                      height: Int(targetSize.height),
                                      bitsPerComponent: 8,
                                      bytesPerRow: CVPixelBufferGetBytesPerRow(imageBuffer),
                                      space: rgbColorSpace,
                                      bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue) else {
            return nil
        }

        context.translateBy(x: 0, y: targetSize.height)
        context.scaleBy(x: 1.0, y: -1.0)

        UIGraphicsPushContext(context)
        self.draw(in: CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height))
        UIGraphicsPopContext()

        CVPixelBufferUnlockBaseAddress(imageBuffer, [])

        return imageBuffer
    }
}
