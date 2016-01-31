//
//  DetailViewController.swift
//  Project1
//
//  Created by James  Farrell on 03/10/2015.
//  Copyright © 2015 James  Farrell. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailImageView: UIImageView!
    
    
    func shareTapped() {
        /* lets you share. First parameter is the thing(s) you're sharing and second is addtional sharing options
        let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        presentViewController(vc, animated: true, completion: nil)
        */
        
        let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        vc.setInitialText("Testing")
        vc.addImage(detailImageView.image!)
        vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(vc, animated: true, completion: nil)

    }


    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

