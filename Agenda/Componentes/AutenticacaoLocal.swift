//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Fernanda Andreia Nascimento on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {
    
    // MARK: Variaveis
    
    var error:NSError?
    
    
    // MARK: Métodos
    
    func autorizaUsuario(completion:@escaping(_ autenticado:Bool) -> Void){
        let contexto = LAContext()
        
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "É necessário autorizacao para excluir", reply: { (resposta, error) in
                
              completion(resposta)
            })
        }

    }


}
