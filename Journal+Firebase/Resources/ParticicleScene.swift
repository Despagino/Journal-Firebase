//
//  ParticicleScene.swift
//  Journal+Firebase
//
//  Created by Ivan Ramirez on 2/17/22.
//

import Foundation
import SpriteKit

class particleScene: SKScene {
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        setupParticleEmitter()
    }

    private func setupParticleEmitter() {
        let particleEmitter = SKEmitterNode(fileNamed: "SnowParticle") ??  SKEmitterNode()

        particleEmitter.position = CGPoint(x: size.width / 2, y: size.height - 50)

        addChild(particleEmitter)
    }
}
