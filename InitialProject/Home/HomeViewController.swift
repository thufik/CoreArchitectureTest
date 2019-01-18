//
//  HomeViewController.swift
//  InitialProject
//
//  Created by EquipeSuporteAplicacao on 9/1/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import CoreArchitecture
import UIKit

class HomeViewController: UIViewController {

    var homeComponent : HomeComponent!
    var core : Core!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeComponent.subscribe(self)
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController : Subscriber{
    typealias StateType = HomeState
    
    func perform(_ navigation: Navigation) {
        
    }
    
    func update(with state: HomeViewController.StateType) {
        
    }
}
