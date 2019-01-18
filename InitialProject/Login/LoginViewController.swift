//
//  ViewController.swift
//  InitialProject
//
//  Created by EquipeSuporteAplicacao on 8/31/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Alamofire
import CoreArchitecture
import UIKit

class LoginViewController: UIViewController {
    
    var core : Core!
    var loginComponent : LoginComponent!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginComponent.subscribe(self)
    }

    @IBAction func enter(_ sender: UIButton) {
        self.core.dispatch(LoginAction.login)
    }
}

extension LoginViewController : Subscriber{
    typealias StateType = LoginState
    
    func perform(_ navigation: Navigation) {
        
        guard let navigation = navigation as? BasicNavigation else {
            return
        }
        
        switch navigation {
        case .present(let toComponent, from: let fromComponent):
            let homeVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
            homeVC.homeComponent = toComponent as! HomeComponent
            self.present(homeVC, animated: true, completion: nil)
        default : print("qualquer")
        }
    }
    
    func update(with state: StateType) {
        if state.isLoading{
            print("Carregando")
        }else{
            print("Carregado")
        }
    }
}

