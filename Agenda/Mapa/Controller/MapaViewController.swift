//
//  MapaViewController.swift
//  Agenda
//
//  Created by Fernanda Andreia Nascimento on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class MapaViewController: UIViewController {
    
    // MARK: - Variavel
    var aluno:Aluno?
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        print(aluno?.nome)
    }
    
    func getTitulo() -> String {
        return "Localizar Alunos"
    }


}
