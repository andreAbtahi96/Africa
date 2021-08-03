//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Andre Abtahi on 7/27/21.
//
//  Complex animation could be power consuming but modifier "Drawing Group" can help power consumption

import SwiftUI

struct MotionAnimationView: View {
    
    //  properties
    
    //  Create multiple circles. property stores random number
    @State private var randomCircle = Int.random(in: 12...16)
    
    //  Create animation.
    @State private var isAnimating: Bool = false
    
    //  functions
    
    //  1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    //  2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    //  3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    //  4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    //  5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    //  body
    var body: some View {
        GeometryReader { geommetry in
            
            //  will print out the exact size in points
            //  when wrapped in this view. The origin realigns top left
            ZStack {
                
                //  will repeat circle as many times as randomCircle property
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale(): 1)
                        //  Helps to make circle center screen
                        .position(
                            x: randomCoordinate(max: geommetry.size.width),
                            y: randomCoordinate(max: geommetry.size.height)
                    )// Position
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )// .animation
                        .onAppear(perform:{
                            isAnimating = true
                        })
                }// LOOP
            }// ZSTACK
            //  rendor into sequential still images rather than simultaneously
            .drawingGroup()
        } //GEOMETRY
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
