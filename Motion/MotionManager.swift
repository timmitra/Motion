//
//  MotionManager.swift
//  Motion
//
//  Created by Tim Mitra on 2024-03-11.
//

import CoreMotion

class MotionManager {
  private var motionManager = CMMotionManager()
  var pitch = 0.0
  var roll = 0.0
  var yaw = 0.0
  
  init() {
    motionManager.startDeviceMotionUpdates(to: OperationQueue()) { [weak self] motion, error in
      guard let self = self, let motion = motion else { return }
      self.pitch = motion.attitude.pitch
      self.yaw = motion.attitude.yaw
      self.roll = motion.attitude.roll
    }
  }
  
  deinit {
    motionManager.stopDeviceMotionUpdates()
  }
}
