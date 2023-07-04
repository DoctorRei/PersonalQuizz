//
//  File.swift
//  PersonalQuizz
//
//  Created by Акира on 29.06.2023.
//

struct Questions {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
   static func getQuestions() -> [Questions] {
        [
            Questions(
                title: "К вам подходит потерявшийся ребенок. Ваши действия?",
                responseType: .singe,
                answers: [
                    Answer(title: "Вызвать полицию", faculty: .ravenclaw),
                    Answer(title: "Пойти искать родителей", faculty: .gryffindor),
                    Answer(title: "Увести в безопасное место", faculty: .hufflepuff),
                    Answer(title: "Развернуться и уйти", faculty: .slytherin)
                ]
            ),
            Questions(
                title: "Как вы проводите свободное время?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Отдыхаю с друзьями", faculty: .gryffindor),
                    Answer(title: "Помогаю нуждающимся", faculty: .hufflepuff),
                    Answer(title: "Провожу время в высшем обществе", faculty: .slytherin),
                    Answer(title: "Занимаюсь саморазвитием", faculty: .ravenclaw)
                ]
            ),
            Questions(
                title: "Как вы относитесь к учебе?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", faculty: .gryffindor),
                    Answer(title: "Когда нужно", faculty: .slytherin),
                    Answer(title: "Хорошо", faculty: .hufflepuff),
                    Answer(title: "Обожаю", faculty: .ravenclaw)
                ]
            )
        ]
    }
}

enum ResponseType {
    case singe
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let faculty: Faculty
}

enum Faculty: String {
    case gryffindor = "Гриффиндор! 🦁"
    case hufflepuff = " Хаффлпафф! 🦡"
    case ravenclaw = "Равенкло! 🦅"
    case slytherin = "Слизерин! 🐍"
    
    var definition: String {
        switch self {
        case .gryffindor:
            return "В Гриффиндоре всегда ценили храбрость, отвагу, мужество и рыцарство"
        case .hufflepuff:
            return "В Хаффлпаффе всегда ценили тяжелую работу, самоотверженность, терпение, лояльность и честную игру"
        case .ravenclaw:
            return "В Равенкло всегда ценили интеллект, знания, любопытство, креативность и остроумие."
        case .slytherin:
            return "В Слизерине всегда ценили амбиции, лидерство, самосохранение, хитрость и находчивость"
        }
    }
}
