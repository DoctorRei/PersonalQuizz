//
//  ResultViewController.swift
//  PersonalQuizz
//
//  Created by Акира on 30.06.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var labelResultFull: UILabel!
    
    var resultCamp: [Faculty] = []
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton.toggle()
        facultyResult()
    }
    
    // MARK: - IBAction
    
    @IBAction func barButtonExit(_ sender: UIBarButtonItem) {
        view.window?.rootViewController?.dismiss(animated: true)
    }
    
    // MARK: - Methods
    
    private func facultyResult() {
        var userPickedAnswers: [Faculty: Int] = [:]
        
        for hogwartsHat in resultCamp {
            if let facultyPointCounts = userPickedAnswers[hogwartsHat] {
                userPickedAnswers.updateValue(facultyPointCounts + 1, forKey: hogwartsHat)
            } else {
                userPickedAnswers[hogwartsHat] = 1
            }
        }
        
        let sortedResultFaculty = userPickedAnswers.sorted { $0.value > $1.value }
        guard let resultFaculty = sortedResultFaculty.first?.key else { return }

        updateUI(resultFaculty)
        
    }
    
    private func updateUI(_ faculty: Faculty) {
        labelResult.text = faculty.rawValue
        labelResultFull.text = faculty.definition
    }
    
}

