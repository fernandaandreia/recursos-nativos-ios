//
//  MapaViewController.swift
//  Agenda
//
//  Created by Fernanda Andreia Nascimento on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    // MARK: - Variavel
    var aluno:Aluno?
    lazy var localizacao = Localizacao()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        localizacaoInicial()
        localizarAluno()
        mapa.delegate = localizacao
        
    }
    
    // MARK: - Métodos
    func getTitulo() -> String {
        return "Localizar Alunos"
    }
    
    func localizacaoInicial(){
        Localizacao().converteEnderecoEmCoordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
            let pino = Localizacao().configuraPino(titulo: "Caelum", localizacao: localizacaoEncontrada, cor: .black, icone: UIImage(named: "icon_caelum")!)
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno(){
        func localizarAluno() {
            if let aluno = aluno {
                Localizacao().converteEnderecoEmCoordenadas(endereco: aluno.endereco!, local: { (localizacaoEncontrada) in
                    let pino = Localizacao().configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada, cor: .black, icone: UIImage(named: "icon_caelum.png")!)
                    self.mapa.addAnnotation(pino)
                    
                })
            }
        }
    }

    

}
