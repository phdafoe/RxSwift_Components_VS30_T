//
//  SubmissionViewController.swift
//  RxSwift_Components_VS30_T
//
//  Created by Andres Felipe Ocampo Eljaiesk on 30/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class SubmissionViewController: UIViewController {

    var submissionString: String = "--"
    
    @IBOutlet weak var submissionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "View Your Submission"
        self.navigationItem.backBarButtonItem?.title = "BACK"
        submissionTextView.text = submissionString
    }

}
