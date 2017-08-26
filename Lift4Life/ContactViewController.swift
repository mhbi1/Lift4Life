//
//  ContactViewController.swift
//  Lift4Life
//
//  Created by Michael Bi on 8/25/17.
//  Copyright © 2017 Life 4 Life: Strength & Conditioning LLC. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    var toggle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.showMenuG(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.showMenuG(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
