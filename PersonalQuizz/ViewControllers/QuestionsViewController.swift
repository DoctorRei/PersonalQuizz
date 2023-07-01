//
//  ViewController.swift
//  PersonalQuizz
//
//  Created by Акира on 29.06.2023.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.maximumValue = answerCount
            rangedSlider.value = answerCount / 2
        }
    }
    @IBOutlet var rangedLabels: [UILabel]!
    
    private let questions = Questions.getQuestions()
    private var questionIndex = 0
    private var answerschosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return}
        let currentAnswer = currentAnswers[buttonIndex]
        answerschosen.append(currentAnswer)
        
        nextQuestion()
        
    }
    
    @IBAction func multipleButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerschosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answerschosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
}


// MARK: - Extensions
extension QuestionsViewController {
    //Hide elements of view
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        // Выбираем правильный вопрос
        let currentQuestion = questions[questionIndex]
        
        // Заполняем лейбл текстом текущего вопроса
        questionLabel.text = currentQuestion.title
        
        // Расчет для прогресс бара
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // указываем прогресс бар для questionProgressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Устанавливаем номер ответа
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.responseType)
    }
    
    func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .singe:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .ranged:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
            
        }
    }
    
    private func showMultipleStackView (with answers: [Answer]) {
        multipleStackView.isHidden.toggle()
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRangedStackView (with answers: [Answer]) {
        rangedStackView.isHidden.toggle()
        
        rangedLabels.first?.text = answers.first?.title
        rangedLabels.last?.text = answers.last?.title
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
}
