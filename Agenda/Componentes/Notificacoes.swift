//
//  Notificacoes.swift
//  Agenda
//
//  Created by Fernanda Andreia Nascimento on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Notificacoes: NSObject {
    
    func exibeNotificaDeMediaDosAlunos(dicionarioDeMedia:Dictionary<String, Any>) -> UIAlertController?{
        if let media = dicionarioDeMedia["media"] as? String{
            
            let alerta = UIAlertController(title: "Atencao", message: "a media geral dos alunos é: \(media)", preferredStyle: .alert)
            
            let botao = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alerta.addAction(botao)
            
            return alerta
        }
  
        return nil
    }

}
