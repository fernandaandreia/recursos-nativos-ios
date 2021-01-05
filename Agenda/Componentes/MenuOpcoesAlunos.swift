//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Fernanda Andreia Nascimento on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

enum MenuActionSheetAluno {
    case sms
}

class MenuOpcoesAlunos: NSObject {
    
    func configuraMenuDeOpcoesDoAluno(completion: @escaping(_ opcao: MenuActionSheetAluno)-> Void) -> UIAlertController{
        let menu = UIAlertController(title: "Atencao", message: "escolha uma das opcoes abaixo", preferredStyle: .actionSheet)
        
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { (acao) in
            completion(.sms)
        }
        menu.addAction(sms)
        
        let cancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        menu.addAction(cancelar)
        
        return menu
    }

}
