//
//  Chart2ViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 18/10/21.
//

import UIKit
import Charts
import TinyConstraints
import Firebase
import FirebaseFirestore
import Foundation
class Chart2ViewController: UIViewController {

    @IBOutlet weak var Barra: UIView!
    
    let db = Firestore.firestore()
    
    var datos = [0,0,0]
    var tops = [Top]()
    var motivos = [Top]()
    var intervenciiones = [Top] ()
    var cuota = 0.0
    
    /*
    func fetchTopMotivos(completion: @escaping (Result<[(key:String, value:Int)], Error>)-> Void){
        var usuarios : [String:Int] = [:]
            db.collection("Sesiones").document("TPfPepPLOtvUX0f0oq61").collection("Motivo").getDocuments{ (querySnapshot, err) in
                if let err = err {
                    print("Error getting document: \(err)")
                    completion(.failure(err))
                } else {
                    for document in querySnapshot!.documents {
                        var m = SesionViewController(aDoc: document)
                        let motivoExist = usuarios[m.Motivo] != nil
                        if motivoExist{
                            usuarios[m.Motivo]! += 1
                        }
                        else {
                            usuarios[m.Motivo] = 1
                        }
                    }
                    let retDic = usuarios.sorted { $0.value > $1.value}
                    completion(.success(retDic))
                }
            }
        }*/
    
    
    
    
    
    lazy var sesionesChart:BarChartView = {
        let ChartView = BarChartView()
        return ChartView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Barra.addSubview(sesionesChart)
        sesionesChart.center(in: Barra)
        sesionesChart.width(to: Barra)
        sesionesChart.heightToWidth(of: Barra)
        sesionesChartActualiza()

        //fetcher
        // Do any additional setup after loading the view.
    }
    
    func sesionesChartActualiza(){
        
        
        db.collection("Sesiones").whereField("Cuota", isEqualTo: 100)
            .getDocuments() { [self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        let lect = document.data().count
                        print(lect)
                        
                        db.collection("Sesiones").whereField("Cuota", isEqualTo: 150)
                            .getDocuments() { [self] (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    for document in querySnapshot!.documents {
                                        
                                        let vid = document.data().count
                                        print(vid)
                                        
                                        
                                        db.collection("Sesiones").whereField("Cuota", isEqualTo: 200)
                                            .getDocuments() { [self] (querySnapshot, err) in
                                                if let err = err {
                                                    print("Error getting documents: \(err)")
                                                } else {
                                                    for document in querySnapshot!.documents {
                                                        
                                                        let dia = document.data().count
                                                        print(dia)
                                                        
                                                        
                                                        db.collection("Sesiones").whereField("Cuota", isEqualTo: 20)
                                                            .getDocuments() { [self] (querySnapshot, err) in
                                                                if let err = err {
                                                                    print("Error getting documents: \(err)")
                                                                } else {
                                                                    for document in querySnapshot!.documents {
                                                                        
                                                                        let info = document.data().count
                                                                        print(info)
                                                                        
                                                                        
                                                                        
                                                                       
                                                                                        
                                                                        
                                                                                       
                                                                            let punto1 = BarChartDataEntry(x: 1, y: Double(lect)) //dialogo
                                                                            let punto2 = BarChartDataEntry(x: 2, y: Double(vid)) //infografia
                                                                            let punto3 = BarChartDataEntry(x: 3, y: Double(dia)) //meditacion
                                                                            let punto4 = BarChartDataEntry(x: 4, y: Double(info))//encuadre
                                                                                                        
                                                                                            
                                                                                                        var sesionesArreglo = [BarChartDataEntry]()
                                                                                                        sesionesArreglo.append(punto1)
                                                                                                        sesionesArreglo.append(punto2)
                                                                                                        sesionesArreglo.append(punto3)
                                                                                                        sesionesArreglo.append(punto4)
                                                                                                       
                                                                                                        
                                                                                                        
                                                                                                        var sesionesDataSet = BarChartDataSet(entries: sesionesArreglo)
                                                                                                        var data = BarChartData(dataSet: sesionesDataSet)
                                                                                                        sesionesChart.data = data
                                                                                                        sesionesChart.chartDescription?.text = "Cuota"
                                                                                                        sesionesChart.notifyDataSetChanged()
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                                        
                                                                                              
                                                                                        
                                                                             
                                                                        
                                                                    }
                                                                }
                                                            }
                                                        
                                                    }
                                                }
                                                
                                            }
                                        
                                       
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                        
                        
                    }
                }
        }
        
        
        
            


        }

}
