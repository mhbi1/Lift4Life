//
//  TPViewController.swift
//  Lift4Life
//
//  Created by Michael Bi on 8/25/17.
//  Copyright © 2017 Life 4 Life: Strength & Conditioning LLC. All rights reserved.
//

import UIKit

class TPViewController: UIViewController {

    
    @IBOutlet weak var eliteAthlete: UIButton!
    @IBOutlet weak var speedster: UIButton!
    @IBOutlet weak var prodigy: UIButton!
    @IBOutlet weak var FourthQuarter: UIButton!
    @IBOutlet weak var loneWolf: UIButton!
    @IBOutlet weak var dreamTeam: UIButton!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    var toggle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets up the swiping gestures to close and open menu
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.showMenuG(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.showMenuG(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        // Sets the buttons to change when highlighted
        eliteAthlete.setBackgroundImage(#imageLiteral(resourceName: "tpButton2") , for: UIControlState.highlighted)
        speedster.setBackgroundImage(#imageLiteral(resourceName: "tpButton2") , for: UIControlState.highlighted)
        prodigy.setBackgroundImage(#imageLiteral(resourceName: "tpButton2") , for: UIControlState.highlighted)
        FourthQuarter.setBackgroundImage(#imageLiteral(resourceName: "tpButton2") , for: UIControlState.highlighted)
        loneWolf.setBackgroundImage(#imageLiteral(resourceName: "tpButton2") , for: UIControlState.highlighted)
        dreamTeam.setBackgroundImage(#imageLiteral(resourceName: "tpButton2") , for: UIControlState.highlighted)
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
