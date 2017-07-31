//
//  WelcomeViewController.swift
//  UITableViewDemo
//
//  Created by Jeremy Seibert on 7/29/17.
//  Copyright © 2017 Jeremy Seibert. All rights reserved.
//

import UIKit
import FirebaseAuth

class WelcomeViewController: UIViewController
{
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func loginDidTouch(_ sender: AnyObject)
    {
        (sender as! UIButton).alpha = 1.0
        
        // TODO: Login Anonymously here
        Auth.auth().signInAnonymously { (firUser, error) in
            if error == nil {
                self.performSegue(withIdentifier: "Show Stories", sender: nil)
            } else {
                // CHALLENGE: display an alert view to show the error message - error.localizedDescription
                print(error)
            }
        }
    }
    
    @IBAction func loginTouchDown(_ sender: AnyObject)
    {
        (sender as! UIButton).alpha = 0.8
    }
}











