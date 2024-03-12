//
//  ContentView.swift
//  Motion
//
//  Created by Tim Mitra on 2024-03-11.
//

import SwiftUI

struct ContentView: View {
  @State private var particleSystem = ParticleSystem() // not observable so don't need Object
  
    var body: some View {
      TimelineView(.animation) { timeline in
        Canvas { context, size in
          let timelineDate = timeline.date.timeIntervalSinceReferenceDate
          particleSystem.update(date: timelineDate)
          
          context.blendMode = .plusLighter
          //content.addFilter(.colorMultiply(.green))
          
          for particle in particleSystem.particles {
            let xPos = particle.x * size.width
            let yPos = particle.y * size.height
            
            var contextCopy = context
            contextCopy.addFilter(.colorMultiply(Color(hue: particle.hue, saturation: 1, brightness: 1)))
            contextCopy.opacity = 1 - (timelineDate - particle.creationDate)
            contextCopy.draw(particleSystem.image, at: CGPoint(x: xPos, y: yPos))
          }
        }
      }
      .gesture(
        DragGesture(minimumDistance: 0)
          .onChanged{ drag in
            particleSystem.center.x = drag.location.x / UIScreen.main.bounds.width
            particleSystem.center.y = drag.location.y / UIScreen.main.bounds.height

          }
      )
      .ignoresSafeArea()
      .background(.black)

    }
}

#Preview {
    ContentView()
}
