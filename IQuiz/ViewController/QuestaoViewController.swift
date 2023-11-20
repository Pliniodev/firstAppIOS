//
//  QuestaoViewController.swift
//  IQuiz
//
//  Created by Plinio da Silva Alencar on 08/11/23.
//

import UIKit

class QuestaoViewController: UIViewController {

    var pontuacao = 0
    var numeroQuestao = 0
    
    @IBOutlet var botoesResposta: [UIButton]!
    @IBOutlet weak var tituloQuestao: UILabel!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertou = questoes[numeroQuestao].respostaCorreta == sender.tag
        
        if usuarioAcertou {
            pontuacao += 1
            sender.backgroundColor = UIColor.corDeFundoVerde
        } else {
            sender.backgroundColor = UIColor.corDeFundoVermelho
        }
        
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            espera(segundos: 0.5, execute: configurarQuestao)
        } else {
            navegaParaTelaDesempenho()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarLayout()
        configurarQuestao()
    }
    
    //segue é uma transição entre telas
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoViewController = segue.destination as? DesempenhoViewController else {return}
        desempenhoViewController.pontuacao = pontuacao
    }
    
    func navegaParaTelaDesempenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }

    func configurarLayout() {
        navigationItem.hidesBackButton = true
        tituloQuestao.numberOfLines = 0
        tituloQuestao.textAlignment = .center
        for botao in botoesResposta {
            botao.layer.cornerRadius = 12.0
        }
    }
    
    @objc func configurarQuestao() {
        tituloQuestao.text = questoes[numeroQuestao].titulo
        for botao in botoesResposta {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1)
        }
    }
    
    func espera(segundos: Double, execute: () -> Void) {
        Timer.scheduledTimer(
            timeInterval: 0.5,
            target: self,
            selector: #selector(configurarQuestao),
            userInfo: nil,
            repeats: false
        )
    }
}
