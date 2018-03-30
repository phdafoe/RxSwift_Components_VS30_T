//
//  FormViewModel.swift
//  RxSwift_Components_VS30_T
//
//  Created by Andres Felipe Ocampo Eljaiesk on 30/3/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation


struct FormViewModel {
    
    let name : Observable<String> = Observable()
    let companyName : Observable<String> = Observable()
    let yearsOfExperience : Observable<Double> = Observable()
    let isCurrentEmployer : Observable<Bool> = Observable()
    let approxSalary : Observable<Float> = Observable()
    let comments : Observable<String> = Observable()
    
    func getExperienceString() -> String{
        if let yearOfExperienceDes = yearsOfExperience.value{
            return "\(yearOfExperienceDes) yrs"
        }
        return "--"
    }
    
    func getSalaryString() -> String{
        if let approxSalaryDes = approxSalary.value{
            let normalizedValue = approxSalaryDes
            return "\(normalizedValue)k"
        }
        return "--"
    }
    
    func getPrettyString() -> String{
        return
            "Name: \(String(describing: name.value ?? "--"))\n" +
            "Company: \(String(describing: companyName.value ?? "--"))\n" +
            "Experience: \(getExperienceString())\n" +
            "Current Employer?: \(((isCurrentEmployer.value ?? false) ? "YES" : "NO"))\n" +
            "approx Salary: \(getSalaryString())\n" +
            "Comments: \(String(describing: comments.value ?? "--"))"
        
    }
    
}
