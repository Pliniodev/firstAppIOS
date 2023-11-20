//
//  Questao.swift
//  IQuiz
//
//  Created by Plinio da Silva Alencar on 20/11/23.
//

import Foundation

struct Questao {
    var titulo: String
    var respostas: [String]
    var respostaCorreta: Int
}

let questoes: [Questao] = [
    Questao(
        titulo: "Qual feitiço para desarmar o seu oponente, em Harry Potter?",
        respostas: ["Expecto Patronum", "Avada quedavra", "Expelliarmus"],
        respostaCorreta: 2
    ),
    Questao(
        titulo: "Quando foi lançado o filme vingadores ultimato",
        respostas: ["2019", "2020", "2021"],
        respostaCorreta: 0
    ),
    Questao(
        titulo: "Quando foi lançado o filme Avatar 2",
        respostas: ["2014", "2022", "2023"],
        respostaCorreta: 1
    )
]
