//
//  ResultViewController.swift
//  PersonalQuizz
//
//  Created by Акира on 30.06.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var labelResult: UILabel!
    @IBOutlet var labelResultFull: UILabel!
    
    var resultCamp: [Faculty] = []
    
    
    //    var gryffindorTotal = 0
    //    var hufflepuffTotal = 0
    //    var ravenclawTotal = 0
    //    var slytherinTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton.toggle()
        print(resultCamp)
        print(type(of: resultCamp))
        facultyResult()
        
        
    }
    
    
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
        
        print(userPickedAnswers)
        let sortedResultFaculty = userPickedAnswers.sorted { $0.value > $1.value }
        print(sortedResultFaculty)
        guard let resultFaculty = sortedResultFaculty.first?.key else { return }
        print(resultFaculty)
        
        updateUI(resultFaculty)
        
    }
    
    private func updateUI(_ faculty: Faculty) {
        labelResult.text = faculty.rawValue
        labelResultFull.text = faculty.definition
    }
    
}

