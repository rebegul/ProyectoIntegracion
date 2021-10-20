//
//  Chart3ViewController.swift
//  ProyectoIntegracion
//
//  Created by Ian Sanchez on 18/10/21.
//


import UIKit
import Charts
import TinyConstraints
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class Chart3ViewController: UIViewController {

   
    //var ref: DatabaseReference!

    let db = Firestore.firestore()
    
    
    @IBOutlet weak var Pie: UIView!
    
    
   
    
    lazy var pieChart:PieChartView = {
        let pieChartView = PieChartView()
        return pieChartView
    }()
    
    //func recupera (nombre: String,)
    func recuperardatos (nombre: String, completion: @escaping (Result<String, Error>) -> Void) {
        //var cuantos: String
        //var resp:Int = 0
        var tan: String = nombre
        
        db.collection("Sesiones").whereField("Servicio", isEqualTo: nombre)
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
    
    var acom:Int = 0
    var holi:Int = 0
    var alter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Pie.addSubview(pieChart)
        pieChart.center(in:Pie)
        pieChart.width(to:Pie)
        pieChart.heightToWidth(of: Pie)
        
        pieChartUpdate()
        // Do any additional setup after loading the view.
        
    }
    
    func pieChartUpdate () {
        
        
        let acompa = recuperardatos(nombre: "Acompañamiento"){ [self]
            (resultado) in
            
            
            switch resultado{
            case .success(let exito):
                self.acom = exito.count
                
                let holistico = recuperardatos(nombre: "Holístico"){
                    (resultado) in
                    
                    
                    switch resultado{
                    case .success(let exito):
                        self.holi = exito.count
                        
                        let alternativo = recuperardatos(nombre: "Rebeca Guevara"){
                            (resultado) in
                            
                            
                            switch resultado{
                            case .success(let exito):
                                self.alter = exito.count
                                print(acom)
                                print(holi)
                                print(alter)
                                
                                let entry1 = PieChartDataEntry(value: Double(alter), label:"Alternativo")
                                            let entry2 = PieChartDataEntry(value: Double(holi), label: "Holistico")
                                            let entry3 = PieChartDataEntry(value: Double(acom), label: "Acompañamiento")
                                            let dataSet = PieChartDataSet(entries: [entry1, entry2,entry3], label: "Usuarios atendidos")
                                                                                
                                      dataSet.colors = ChartColorTemplates.vordiplom()
                                                                                
                                    let data = PieChartData(dataSet: dataSet)
                                                                                
                                    pieChart.data = data
                                                                                
                                    pieChart.chartDescription?.text = "Usuarios"
                                                                                
                                    pieChart.holeColor = UIColor.clear
                                                                                
                                    pieChart.chartDescription?.textColor = UIColor.blue
                                                                                
                                    pieChart.legend.textColor = UIColor.blue
                                                                                
                                    pieChart.notifyDataSetChanged()
                                
                            case .failure(let error):print(error)
                            }
                            
                        }
                    case .failure(let error):print(error)
                    }
                    
                }
            case .failure(let error):print(error)
            }
            
        }
        /*
        db.collection("Sesiones").whereField("Servicio", isEqualTo: "Acompañamiento")
            .getDocuments() { [self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        let acom = document.data().count
                        print(acom)
                        
                        
                        db.collection("Sesiones").whereField("Servicio", isEqualTo: "Holísticos")
                            .getDocuments() { [self] (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    for document in querySnapshot!.documents {
                                        
                                        let hol = document.data().count
                                        print(hol)
                                        
                                        
                                        db.collection("Sesiones").whereField("Servicio", isEqualTo: "Alternativas")
                                            .getDocuments() { [self] (querySnapshot, err) in
                                                if let err = err {
                                                    print("Error getting documents: \(err)")
                                                } else {
                                                    for document in querySnapshot!.documents {
                                                        
                                                        let alt = document.data().count
                                                        print(alt)
                                                        */
                                                        
                                                        let entry1 = PieChartDataEntry(value: 1, label: "Acompañamiento")
                                                        let entry2 = PieChartDataEntry(value: 2, label: "Holistico")
                                                        let entry3 = PieChartDataEntry(value: 3, label: "Alternativas")
                                                        let dataSet = PieChartDataSet(entries: [entry1, entry2,entry3], label: "Tipo de servicios")
                                                        
                                                        dataSet.colors = ChartColorTemplates.pastel()
                                                        
                                                        let data = PieChartData(dataSet: dataSet)
                                                        
                                                        pieChart.data = data
                                                        
                                                        pieChart.chartDescription?.text = "Tipo de servicios"
                                                        
                                                        pieChart.holeColor = UIColor.clear
                                                        
                                                        pieChart.chartDescription?.textColor = UIColor.blue
                                                        
                                                        pieChart.legend.textColor = UIColor.blue
                                                        
                                                        pieChart.notifyDataSetChanged()
        /*
                                                        
                                                    }
                                                }
                                            }
                                        
                                        
                                    }
                                }
                            }
                        
                    }
                }
            }
        */
        
           
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
}
