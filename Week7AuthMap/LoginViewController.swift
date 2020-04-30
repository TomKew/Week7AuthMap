//
//  ViewController.swift
//  Week7AuthMap
//
//  Created by Field Employee on 4/30/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let context:LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Required for login") { (good, error) in
                DispatchQueue.main.async {
                    if good {
                        self.navigateToMapView()
                                return
                            }
                            switch error {
                            case LAError.authenticationFailed?:
                              print("There was a problem verifying your identity.")
                                let alert = UIAlertController(title: "Authentication Failed", message: "You have failed many times to identify yourself", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                                self.present(alert, animated: true)
                            case LAError.userCancel?:
                              print("You pressed cancel.")
                              let alert = UIAlertController(title: "Authentication Failed", message: "Biometric authentication failed. Try again", preferredStyle: .alert)
                              alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                              self.present(alert, animated: true)
                            case LAError.userFallback?:
                              print("You pressed password.")
                            case LAError.biometryNotAvailable?:
                              print("Face ID/Touch ID is not available.")
                            case LAError.biometryNotEnrolled?:
                              print("Face ID/Touch ID is not set up.")
                            case LAError.biometryLockout?:
                              print("Face ID/Touch ID is locked.")
                            default:
                              print("Face ID/Touch ID may not be configured")
                            }
                        }
                    }
                }
    }
    func navigateToMapView() {
        let MapView = self.storyboard?.instantiateViewController(withIdentifier: "MapView")
         navigationController?.pushViewController(MapView!, animated: true)
    }



}

