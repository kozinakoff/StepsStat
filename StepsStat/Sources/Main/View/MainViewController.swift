//
//  MainViewController.swift
//  StepsStat
//
//  Created by ANDREY VORONTSOV on 22.01.2021.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = createStepsStatListView()
        addChild(vc)
        vc.view.frame = view.frame
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    private func createStepsStatListView() -> UIViewController {
        let vc = StepsStatListView()
        return vc
    }
}

