//
//  Particle.swift
//  Motion
//
//  Created by Tim Mitra on 2024-03-11.
//

import Foundation

struct Particle: Hashable {
  let x: Double
  let y: Double
  let creationDate = Date.now.timeIntervalSinceReferenceDate
}
