//
//  Chart2ViewController.swift
//  ProyectoIntegracion
//
//  Created by Marcia Lechuga on 18/10/21.
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
    
    func recuperardatos (nombre: String, completion: @escaping (Result<String, Error>) -> Void) {
        //var cuantos: String
        //var resp:Int = 0
        var tan: String = nombre
        
        db.collection("Sesiones").whereField("Intervencion", isEqualTo: nombre)
            .getDocuments() { [self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completion (.failure(err))
                } else {
                    
                    for document in querySnapshot!.documents {
                        var t = tan
                        tan.append(t)
                       
                        }
                      
                    }
                    //let maybe = resp
                    completion(.success(tan))
                
                }
                
        }
    
    
    
    
    
    
    
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
    var AcomIndi: Int = 0 //
    var Tana: Int = 0 //
    var Mind: Int = 0 //
    var Cristal: Int = 0 //
    var Reiki: Int = 0 //
    var Brisas: Int = 0 //
    var Logo: Int = 0 //
    var Flores: Int = 0 //
    var AcomGru: Int = 0 //
    var Jade: Int = 0
    func sesionesChartActualiza(){
      
                     
       recuperardatos(nombre: "Acompañamiento Individual"){ [self]
            (resultado) in
            
            
            switch resultado{
            case .success(let exito):
                self.AcomIndi = exito.count
                print("Individual 1")
                print(self.AcomIndi)
            case .failure(let error):print(error)
            }
       }
        
        recuperardatos(nombre: "Acompañamiento Grupal"){ [self]
             (resultado) in
             
             
             switch resultado{
             case .success(let exito):
                 self.AcomGru = exito.count
                print("g")
                 print(self.AcomGru)
             case .failure(let error):print(error)
             }
        }
        
            recuperardatos(nombre: "Tanatología"){ [self]
                 (resultado) in
                 
                 
                 switch resultado{
                 case .success(let exito):
                     self.Tana = exito.count
                    print("Tanatologia")
                     print(self.Tana)
                    
                 case .failure(let error):print(error)
                 }
            }
        
        recuperardatos(nombre: "Brisas ambientales"){ [self]
             (resultado) in
             
             
             switch resultado{
             case .success(let exito):
                 self.Brisas = exito.count
                print("Brisas")
                 print(self.Brisas)
                
             case .failure(let error):print(error)
             }
        }
        recuperardatos(nombre: "Mindfulness"){ [self]
             (resultado) in
             
             
             switch resultado{
             case .success(let exito):
                 self.Mind = exito.count
                print("mind")
                 print(self.Mind)
                
             case .failure(let error):print(error)
             }
        }
        
        recuperardatos(nombre: "Cristaloterapia"){ [self]
             (resultado) in
             
             
             switch resultado{
             case .success(let exito):
                 self.Cristal = exito.count
                print("cristal")
                 print(self.Cristal)
                
             case .failure(let error):print(error)
             }
        }
        
        recuperardatos(nombre: "Reiki"){ [self]
             (resultado) in
             
             
             switch resultado{
             case .success(let exito):
                 self.Reiki = exito.count
                print("reiki")
                 print(self.Reiki)
                
             case .failure(let error):print(error)
             }
        }
        
        recuperardatos(nombre: "Logoterapia"){ [self]
             (resultado) in
             
             
             switch resultado{
             case .success(let exito):
                 self.Logo = exito.count
                print("Logo")
                 print(self.Logo)
                
             case .failure(let error):print(error)
             }
        }
        
        recuperardatos(nombre: "Flores de Bach"){ [self]
             (resultado) in
             
             
             switch resultado{
             case .success(let exito):
                 self.Flores = exito.count
                print("flores")
                 print(self.Flores)
                
             case .failure(let error):print(error)
             }
        }
        
        recuperardatos(nombre: "Cama termica de Jade"){ [self]
             (resultado) in
             
             
             switch resultado{
             case .success(let exito):
                 self.Jade = exito.count
                print("Jade")
                 print(self.Jade)
                
             case .failure(let error):print(error)
             }
        }
        
            //print(AcompamientoInd)
                
            let punto1 = BarChartDataEntry(x: 1, y: 1) //dialogo
          let punto2 = BarChartDataEntry(x: 2, y: 2) //infografia
            let punto3 = BarChartDataEntry(x: 3, y: 3) //meditacion
           let punto4 = BarChartDataEntry(x: 4, y: 4)//encuadre
                                                                                                        
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

