//
//  ViewController.swift
//  Lift4Life
//
//  Created by Michael Bi on 8/24/17.
//  Copyright © 2017 Life 4 Life: Strength & Conditioning LLC. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    
    var toggle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets up swiping gesture to show/hide menu
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.showMenuG(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.showMenuG(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        //Makes navigation bar translucent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        //Adds border to bookNow button
        bookButton.layer.cornerRadius = 2;
        bookButton.layer.borderWidth = 2;
        bookButton.layer.borderColor = UIColor.white.cgColor
    }
    
    //Swiping right toggles the menu and swiping left hides it
    @IBAction func showMenuG(_ sender: UISwipeGestureRecognizer) {
            revealViewController().revealToggle(animated:toggle)
            toggle = !toggle
    }
    
    //Clicking on the menu button brings up the menu
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        revealViewController().revealToggle(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

