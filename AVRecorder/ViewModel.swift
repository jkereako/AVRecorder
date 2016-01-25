//
//  ViewModel.swift
//  AVRecorder
//
//  Created by Jeffrey Kereakoglow on 1/25/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import Foundation
import AVFoundation

struct ViewModel {

  func deviceWithMediaType(mediaType: String, preferringPosition position: AVCaptureDevicePosition) -> AVCaptureDevice? {
    let devices = AVCaptureDevice.devicesWithMediaType(mediaType)

    for device in devices {
      if device.position == position, let aDevice = device as? AVCaptureDevice {
        return aDevice
      }
    }

    return nil
  }
}