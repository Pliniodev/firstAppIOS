//
//  ViewController.swift
//  IQuiz
//
//  Created by Plinio da Silva Alencar on 23/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botaoIniciarQuiz: UIButton!
    
    @IBAction func botaoPressionado(_ sender: Any) {
        print("O botão foi pressionado")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }

    func configureLayout() {
        navigationItem.hidesBackButton = true
        botaoIniciarQuiz.layer.cornerRadius = 12.0
    }

}

