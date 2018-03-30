//
//  ViewController.swift
//  RxSwift_Components_VS30_T
//
//  Created by Andres Felipe Ocampo Eljaiesk on 30/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Local Variables
    var viewModel: FormViewModel!
    
    //MARK: - IButlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var isCurrentEmployerSwitch: UISwitch!
    @IBOutlet weak var yearsOfExperienceStepper: UIStepper!
    @IBOutlet weak var salaryRangeSlider: UISlider!
    @IBOutlet weak var selectedSalaryRangeLabel: UILabel!
    @IBOutlet weak var selectedYearsOfExperienceLabel: UILabel!
    @IBOutlet weak var commentsView: BindableTextView! {
        didSet {
            commentsView.layer.borderColor = UIColor.lightGray.cgColor
            commentsView.layer.cornerRadius = 5.0
            commentsView.layer.borderWidth = 1.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FormViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Information Form"
        setupBindings()
        nameField.text = ""
        companyField.text = ""
        commentsView.text = ""
    }
    
    func setupBindings() {
        nameField.bind(with: viewModel.name)
        companyField.bind(with: viewModel.companyName)
        isCurrentEmployerSwitch.bind(with: viewModel.isCurrentEmployer)
        yearsOfExperienceStepper.bind(with: viewModel.yearsOfExperience)
        salaryRangeSlider.bind(with: viewModel.approxSalary)
        commentsView.bind(with: viewModel.comments)
        
        selectedSalaryRangeLabel.observe(for: viewModel.approxSalary) { [weak self](_) in
            self?.selectedSalaryRangeLabel.text = self?.viewModel.getSalaryString()
        }
        
        selectedYearsOfExperienceLabel.observe(for: viewModel.yearsOfExperience) { [weak self](_) in
            self?.selectedYearsOfExperienceLabel.text = self?.viewModel.getExperienceString()
        }
    }
    
    @IBAction func salaryRangeSliderValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value / 1000.0) * 1000.0
        sender.value = roundedValue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSubmission" {
            if let vc = segue.destination as? SubmissionViewController {
                vc.submissionString = viewModel.getPrettyString()
            }
        }
    }
    
    @IBAction func submitFormTapped(_ sender: Any) {}


}

