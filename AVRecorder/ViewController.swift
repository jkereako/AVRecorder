//
//  ViewController.swift
//  AVRecorder
//
//  Created by Jeffrey Kereakoglow on 1/25/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  @IBOutlet weak var cameraAvailabilityLabel: UILabel!
  @IBOutlet weak var stackView: UIStackView!
  @IBOutlet weak var recordButton: UIButton!
  @IBOutlet weak var cameraButton: UIButton!

  private var session: AVCaptureSession?
  private var videoCaptureDevice: AVCaptureDevice?

  override func viewDidLoad() {
    super.viewDidLoad()

    let viewModel = ViewModel()

    videoCaptureDevice = viewModel.deviceWithMediaType(AVMediaTypeVideo, preferringPosition: .Back)

    guard let aVideoCaptureDevice = videoCaptureDevice else {
      cameraAvailabilityLabel.hidden = false
      stackView.hidden = true

      return
    }

    do {
      let videoCaptureDeviceInput = try AVCaptureDeviceInput(device: aVideoCaptureDevice)

      session = AVCaptureSession()

      if session?.canAddInput(videoCaptureDeviceInput) == true {
        session?.addInput(videoCaptureDeviceInput)
      }
    }
    catch {
      print("An error occured")
    }

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

