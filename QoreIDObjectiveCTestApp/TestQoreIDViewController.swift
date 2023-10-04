//
//  TestQoreIDViewController.swift
//  QoreIDObjectiveCTestApp
//
//  Created by Guru King on 04/10/2023.
//

import UIKit
import QoreIDSDK

class TestQoreIDViewController:UIViewController{
    
    override func viewDidLoad() {
        
        let applicant = ApplicantData(firstname: "Jane", lastname:"Doe", phone: "+2348078361234")

        //your client id which can be gotten from your qore id portal
        let clientId = ""
        //generate a unique customer ref

        let customerref = "ref-hhdaxxc-ssid"

        let productcode = ""

        let param = QoreIDParam()
            .clientId(clientId: clientId)
            .customerReference(customerref)
            .collection(productcode)
            .inputData(InputData(applicant: applicant))
            .build()

        QoreIdSdk.shared.launch(param: param, vc: self) { [weak self] result in
            self?.onQoreIdResultReceived(result: result)
        }
        
        view.backgroundColor = .white
    }
    
    func onQoreIdResultReceived(result: QoreIDResult?) {
        if let result = result {
            print("---> QoreIDResult:")
            print("---> \(result)")

            if let errorResult = result as? ErrorResult {
                // Handle error
                print("error from sdk: \(errorResult.message)")
                //  toastLong(errorResult.message)
            } else if let successResult = result as? SuccessResult {
                // Handle success
                if let message = successResult.message {
                    print("success from sdk: \(message)")
                }
            }
        }
    }
}
