//
//  ContactViewController.swift
//  Lift4Life
//
//  Created by Michael Bi on 8/25/17.
//  Copyright © 2017 Life 4 Life: Strength & Conditioning LLC. All rights reserved.
//

import Foundation
import UIKit
import SafariServices
import MessageUI

class ContactViewController: UIViewController, SFSafariViewControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!

    var toggle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets up swiping gestures to show/hide menu
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
        self.navigationController?.view.backgroundColor = .clear
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
    
    @IBAction func sendEmail(_ sender: UIButton) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["jmhlift4life@gmail.com"])
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        sendMailErrorAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleInstagram(_ sender: UIButton) {
        let urlString = "https://www.instagram.com/coach.javi.ii.13/"
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            
            present(vc, animated: true, completion: nil)
        }
    }
   
    @IBAction func handleTwitter(_ sender: UIButton) {
        let urlString = "https://twitter.com/CoachJavi13"
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            
            present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func handleFacebook(_ sender: UIButton) {
        let urlString = "https://www.facebook.com/Lift4LifeOfficial/"
        
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            
            present(vc, animated: true, completion: nil)
        }
    }

    @IBAction func handleYoutube(_ sender: UIButton) {
        let urlString = "https://www.youtube.com/channel/UCe5vY5AoAD8Ky0lPJYEErCw"
            
        if let url = URL(string: urlString) {
            let vc = SFSafariViewController(url: url)
            vc.delegate = self
            
            present(vc, animated: true, completion: nil)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        if didLoadSuccessfully == false {
            print("Page did not load!")
            controller.dismiss(animated: true, completion: nil)
        }
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
