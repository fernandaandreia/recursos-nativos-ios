//
//  Mensagem.swift
//  Agenda
//
//  Created by Fernanda Andreia Nascimento on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
   
    
    // MARK: - Metodos
    
    func configuraSMS(_ aluno:Aluno) -> MFMessageComposeViewController?{
        
        if MFMessageComposeViewController.canSendText(){
            let componementeMensagem =  MFMessageComposeViewController()
            guard let numeroDoAluno = aluno.telefone else { return componementeMensagem}
            componementeMensagem.recipients =  [numeroDoAluno]
            componementeMensagem.messageComposeDelegate = self
            return componementeMensagem
        }
        return nil
    }

    
    // MARK:- MessageComposeDelegate
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
