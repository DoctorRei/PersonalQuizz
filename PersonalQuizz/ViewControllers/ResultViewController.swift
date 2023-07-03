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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton.toggle()
        print(resultCamp)
        print(type(of: resultCamp))
        checkResult(resultCamp)

    }
    

    @IBAction func barButtonExit(_ sender: UIBarButtonItem) {
        view.window?.rootViewController?.dismiss(animated: true)
        
    }
    
    func setupUI() {
    
    }
    
    func checkResult(_ userFaculty: [Faculty]) {
        
        var gryffindorTotal = 0
        var hufflepuffTotal = 0
        var ravenclawTotal = 0
        var slytherinTotal = 0
        
        for i in userFaculty {
            if i == .gryffindor {
                gryffindorTotal += 1
            } else if i == .hufflepuff {
                hufflepuffTotal += 1
            } else if i == .ravenclaw {
                ravenclawTotal += 1
            } else if i == .slytherin {
                slytherinTotal += 1
            }
        }
        
        if gryffindorTotal > hufflepuffTotal
            && gryffindorTotal > ravenclawTotal
            && gryffindorTotal > slytherinTotal {
            
            labelResult.text = "Гриффиндор! " + String(Faculty.gryffindor.rawValue)
            labelResultFull.text = Faculty.gryffindor.definition
            
        } else if hufflepuffTotal > gryffindorTotal
                    && hufflepuffTotal > ravenclawTotal
                    && hufflepuffTotal > slytherinTotal {
            
            labelResult.text = " Хаффлпафф! " + String(Faculty.hufflepuff.rawValue)
            labelResultFull.text = Faculty.hufflepuff.definition
            
        } else if ravenclawTotal > gryffindorTotal && ravenclawTotal > hufflepuffTotal && ravenclawTotal > slytherinTotal {
            
            labelResult.text = "Равенкло! " + String(Faculty.ravenclaw.rawValue)
            labelResultFull.text = Faculty.ravenclaw.definition
            
        } else if slytherinTotal > gryffindorTotal && slytherinTotal > ravenclawTotal && slytherinTotal > hufflepuffTotal {
            
            labelResult.text = "Слизерин! " + String(Faculty.slytherin.rawValue)
            labelResultFull.text = Faculty.slytherin.definition
        }
        
        print(gryffindorTotal, hufflepuffTotal, ravenclawTotal, slytherinTotal)
    }
    
}
