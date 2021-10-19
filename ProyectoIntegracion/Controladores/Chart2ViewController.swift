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
    
    /*
    func fetchTopMotivos(completion: @escaping (Result<[(key:String, value:Int)], Error>)-> Void){
        var usuarios : [String:Int] = [:]
            db.collection("Sesiones").document("TPfPepPLOtvUX0f0oq61").collection("Motivo").getDocuments{ (querySnapshot, err) in
                if let err = err {
                    print("Error getting document: \(err)")
                    completion(.failure(err))
                } else {
                    for document in querySnapshot!.documents {
                        var m = Barra(aDoc: document)
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
        }
    */
    
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
        let punto1 = BarChartDataEntry(x: 1, y: 5)
        let punto2 = BarChartDataEntry(x: 2, y: 8)
        let punto3 = BarChartDataEntry(x: 3, y: 1)
        let punto4 = BarChartDataEntry(x: 4, y: 10)
        var sesionesArreglo = [BarChartDataEntry]()
        sesionesArreglo.append(punto1)
        sesionesArreglo.append(punto2)
        sesionesArreglo.append(punto3)
        sesionesArreglo.append(punto4)
        
        var sesionesDataSet = BarChartDataSet(entries: sesionesArreglo)
        var data = BarChartData(dataSet: sesionesDataSet)
        sesionesChart.data = data
        sesionesChart.chartDescription?.text = "Sesiones por usuario"
        sesionesChart.notifyDataSetChanged()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
