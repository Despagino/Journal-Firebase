//
//  DischargedVC.swift
//  Journal+Firebase
//
//  Created by Ivan Ramirez on 2/16/22.
//

import UIKit
import SpriteKit

class SpriteKitVC: UIViewController {

    private let skView = SKView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        initSKScene()
    }


    private func setUpUI() {
        view.verticalGradient()
        view.addSubview(skView)

        skView.translatesAutoresizingMaskIntoConstraints = false

        //create the constraints
        let top = skView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        let bottom = skView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        let leading = skView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        let trailing = skView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)

        NSLayoutConstraint.activate([top, leading, trailing, bottom])

    }

    private func initSKScene() {
        let particleScene = particleScene(size: CGSize(width: 1080, height: 1920))

        particleScene.scaleMode = .aspectFit
        particleScene.backgroundColor = .clear

        skView.presentScene(particleScene)
    }
}
