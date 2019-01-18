//
//  LoginComponent.swift
//  InitialProject
//
//  Created by EquipeSuporteAplicacao on 9/1/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import Alamofire
import CoreArchitecture
import UIKit

class LoginComponent: Component<LoginState> {
    override func process(_ action: Action) {
        
        guard let action = action as? LoginAction else{
            return
        }
        
        switch action {
            case .login:
                let url = URL(string: "http://localhost:8080/login")
                Alamofire.request(url!, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
                    
                    if let response = response.result.value as? [String : AnyObject]{
                        if let ok = response["sucesso"]{
                            let homeComponent = HomeComponent(state: HomeState(isLoading: false, hasError: nil))
                            self.commit(BasicNavigation.present(homeComponent, from: self))
                        }
                    }
                })
            default:
                print("teste")
        }
    }
}
