//
//  ResultViewController.swift
//  PersonalQuizz
//
//  Created by Акира on 30.06.2023.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func barButtonExit(_ sender: UIBarButtonItem) {
        view.window?.rootViewController?.dismiss(animated: true)
    }
    

}
