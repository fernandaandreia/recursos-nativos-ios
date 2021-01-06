//
//  MapaViewController.swift
//  Agenda
//
//  Created by Fernanda Andreia Nascimento on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    // MARK: - Variavel
    var aluno:Aluno?
    lazy var localizacao = Localizacao()
    lazy var gerenciadorDeLocalizacao = CLLocationManager()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        localizacaoInicial()
        mapa.delegate = localizacao
        verificaAutorizacaoDoUsuario()
        gerenciadorDeLocalizacao.delegate = self
        
    }
    
    // MARK: - Métodos
    func getTitulo() -> String {
        return "Localizar Alunos"
    }
    
    func verificaAutorizacaoDoUsuario(){
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                let botao = Localizacao().configuraBotaoLocalizaoAtual(mapa: mapa)
                mapa.addSubview(botao)
                gerenciadorDeLocalizacao.startUpdatingLocation()
                
                break
            case .notDetermined:
                gerenciadorDeLocalizacao.requestWhenInUseAuthorization()
                
                break
                
            case .denied:
            break
            
            default:
                break
            }
        }
    }
    
    func localizacaoInicial(){
        Localizacao().converteEnderecoEmCoordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
            let pino = Localizacao().configuraPino(titulo: "Caelum", localizacao: localizacaoEncontrada, cor: .black, icone: UIImage(named: "icon_caelum")!)
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
            self.localizarAluno()
        }
    }
    
    func localizarAluno(){
        func localizarAluno() {
            if let aluno = aluno {
                Localizacao().converteEnderecoEmCoordenadas(endereco: aluno.endereco!, local: { (localizacaoEncontrada) in
                    let pino = Localizacao().configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada, cor: .black, icone: UIImage(named: "icon_caelum.png")!)
                    self.mapa.addAnnotation(pino)
                    self.mapa.showAnnotations(self.mapa.annotations, animated: true)
                    
                })
            }
        }
    }

    // MARK: CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            let botao = Localizacao().configuraBotaoLocalizaoAtual(mapa: mapa)
            mapa.addSubview(botao)
            gerenciadorDeLocalizacao.startUpdatingLocation()
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
}
