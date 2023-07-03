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
    
    var totalResults: [String: Int] = [:]
    
    var gryffindorTotal = 0
    var hufflepuffTotal = 0
    var ravenclawTotal = 0
    var slytherinTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton.toggle()
        print(resultCamp)
        print(type(of: resultCamp))
        resultHouse()
        
    }
    
    
    @IBAction func barButtonExit(_ sender: UIBarButtonItem) {
        view.window?.rootViewController?.dismiss(animated: true)
        
    }
    
    // MARK: - Methods
    
    func checkResult(_ userFaculty: [Faculty]) {
        
        for answer in userFaculty {
            if answer == .gryffindor {
                gryffindorTotal += 1
            } else if answer == .hufflepuff {
                hufflepuffTotal += 1
            } else if answer == .ravenclaw {
                ravenclawTotal += 1
            } else if answer == .slytherin {
                slytherinTotal += 1
            }
        }
        
    }
    
    func isUserGriffindor() {
        if gryffindorTotal > hufflepuffTotal
        && gryffindorTotal > ravenclawTotal
        && gryffindorTotal > slytherinTotal {
            
            labelResult.text = "Гриффиндор! " + String(Faculty.gryffindor.rawValue)
            labelResultFull.text = Faculty.gryffindor.definition
        }
    }
    
    func isUserHufflepuff() {
        if hufflepuffTotal > gryffindorTotal
        && hufflepuffTotal > ravenclawTotal
        && hufflepuffTotal > slytherinTotal {
            
            labelResult.text = " Хаффлпафф! " + String(Faculty.hufflepuff.rawValue)
            labelResultFull.text = Faculty.hufflepuff.definition
            
        }
    }
    
    func isUserRavenclaw() {
        if ravenclawTotal > gryffindorTotal
            && ravenclawTotal > hufflepuffTotal
            && ravenclawTotal > slytherinTotal {
            
            labelResult.text = "Равенкло! " + String(Faculty.ravenclaw.rawValue)
            labelResultFull.text = Faculty.ravenclaw.definition
        }
    }
    
    func isUserSlytherin() {
        if slytherinTotal > gryffindorTotal
            && slytherinTotal > ravenclawTotal
            && slytherinTotal > hufflepuffTotal {
            
            labelResult.text = "Слизерин! " + String(Faculty.slytherin.rawValue)
            labelResultFull.text = Faculty.slytherin.definition
        }
    }
    
    func checkUserHouse() {
        isUserGriffindor()
        isUserHufflepuff()
        isUserRavenclaw()
        isUserSlytherin()
    }
    
    func ifTheSameGryffindor() {
        if gryffindorTotal != 0 {
            if gryffindorTotal == hufflepuffTotal  {
                gryffindorTotal += slytherinTotal
                hufflepuffTotal += ravenclawTotal + 1
            } else if gryffindorTotal == ravenclawTotal {
                gryffindorTotal += hufflepuffTotal
                ravenclawTotal += slytherinTotal + 1
            } else if gryffindorTotal == slytherinTotal {
                gryffindorTotal += hufflepuffTotal
                slytherinTotal += ravenclawTotal + 1
            }
        }
    }
    
    func ifTheSameHufflepuff() {
        if hufflepuffTotal != 0 {
            if gryffindorTotal == hufflepuffTotal  {
                gryffindorTotal += slytherinTotal
                hufflepuffTotal += ravenclawTotal + 1
            } else if hufflepuffTotal == ravenclawTotal {
                gryffindorTotal += hufflepuffTotal + 1
                ravenclawTotal += slytherinTotal
            } else if hufflepuffTotal == slytherinTotal {
                gryffindorTotal += hufflepuffTotal + 1
                slytherinTotal += ravenclawTotal
            }
        }
    }
    
    func ifTheSameRavenclaw() {
        if ravenclawTotal != 0 {
            if ravenclawTotal == hufflepuffTotal  {
                ravenclawTotal += slytherinTotal + 1
                hufflepuffTotal += gryffindorTotal
            } else if gryffindorTotal == ravenclawTotal {
                gryffindorTotal += hufflepuffTotal
                ravenclawTotal += slytherinTotal + 1
            } else if ravenclawTotal == slytherinTotal {
                ravenclawTotal += hufflepuffTotal
                slytherinTotal += gryffindorTotal + 1
            }
        }
    }
    
    func ifTheSameSlytherin() {
        if slytherinTotal != 0 {
            if slytherinTotal == hufflepuffTotal  {
                slytherinTotal += gryffindorTotal + 1
                hufflepuffTotal += ravenclawTotal
            } else if slytherinTotal == ravenclawTotal {
                hufflepuffTotal += gryffindorTotal
                slytherinTotal += ravenclawTotal + 1
            } else if gryffindorTotal == slytherinTotal {
                gryffindorTotal += hufflepuffTotal
                slytherinTotal += ravenclawTotal + 1
            }
        } }
        
        func ifTheSameCorrect() {
            ifTheSameGryffindor()
            ifTheSameHufflepuff()
            ifTheSameRavenclaw()
            ifTheSameSlytherin()
        }
        
        
        func resultHouse() {
            checkResult(resultCamp)
            checkUserHouse()
        }
    
    
}

