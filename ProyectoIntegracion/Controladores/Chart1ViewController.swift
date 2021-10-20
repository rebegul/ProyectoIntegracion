//
//  Chart1ViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 18/10/21.
//

import UIKit
import Charts
import TinyConstraints
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class Chart1ViewController: UIViewController {

    let db = Firestore.firestore()
    //var ref: DatabaseReference!

/*
    @IBAction func botonExtra(_ sender: Any) {
        
        db.collection("Sesiones").whereField("Cuota", isEqualTo: 100)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        let resp = document.data().count
                        print(resp)
                        
                        
                    }
                }
        }
        
        
        
        
    }*/
    
    
    
    
    @IBOutlet weak var Pie: UIView!
    
    lazy var pieChart:PieChartView = {
        let pieChartView = PieChartView()
        return pieChartView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Pie.addSubview(pieChart)
        pieChart.center(in:Pie)
        pieChart.width(to:Pie)
        pieChart.heightToWidth(of: Pie)
        
        pieChartUpdate()
        // Do any additional setup after loading the view.
        
    }
    
    //var resp:Int = 0
    
    func recuperardatos (nombre: String, completion: @escaping (Result<String, Error>) -> Void) {
        //var cuantos: String
        //var resp:Int = 0
        var tan: String = nombre
        
        db.collection("Sesiones").whereField("Tanatologo", isEqualTo: nombre)
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
                
    
    
    /*
    func llamadaBD () {
        
        recuperardatos(nombre: "Ian Sánchez"){
            (resultado) in
            switch resultado{
            case .success(let exito):print(exito)
            case .failure(let error):print(error)
            }
            
        }
    }
    */
    
    var ias:Int = 0
    var mal:Int = 0
    var reg:Int = 0
    
    var contador1:Int = 0
    
    func pieChartUpdate () {
      
        
        
        
        let ian = recuperardatos(nombre: "Ian Sánchez"){ [self]
            (resultado) in
            
            
            switch resultado{
            case .success(let exito):
                self.ias = exito.count
                
                let marcia = recuperardatos(nombre: "Marcia Lechuga"){
                    (resultado) in
                    
                    
                    switch resultado{
                    case .success(let exito):
                        self.mal = exito.count
                        
                        let rebeca = recuperardatos(nombre: "Rebeca Guevara"){
                            (resultado) in
                            
                            
                            switch resultado{
                            case .success(let exito):
                                self.reg = exito.count
                                print(ias)
                                print(reg)
                                print(mal)
                                
                                let entry1 = PieChartDataEntry(value: Double(reg), label:"Tanatologo Rebeca")
                                            let entry2 = PieChartDataEntry(value: Double(mal), label: "Tanatologo Marcia")
                                            let entry3 = PieChartDataEntry(value: Double(ias), label: "Tanatologo Ian")
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
        let marcia = recuperardatos(nombre: "Marcia Lechuga"){ [self]
            (resultado) in
            
            
            switch resultado{
            case .success(let exito):
                exito = exito.count
                if exito > 0 {
                    for cuenta in exito{
                        print("no")
                        self.contador1 = self.contador1+1
                        print(self.contador1)
                    }
                }
            case .failure(let error):print(error)
            }
            
        }
        
        let rebeca = recuperardatos(nombre: "Rebeca Guevara"){
            (resultado) in
            
            
            switch resultado{
            case .success(let exito):
                self.reg = exito.count
            case .failure(let error):print(error)
            }
            
        }
        
        print(ias)
        print(reg)
        print(mal)
                       */
        /*
        let entry1 = PieChartDataEntry(value: Double(reg), label:"Tanatologo Rebeca")
                    let entry2 = PieChartDataEntry(value: Double(mal), label: "Tanatologo Marcia")
                    let entry3 = PieChartDataEntry(value: Double(ias), label: "Tanatologo Ian")
                    let dataSet = PieChartDataSet(entries: [entry1, entry2,entry3], label: "Usuarios atendidos")
                                                        
              dataSet.colors = ChartColorTemplates.vordiplom()
                                                        
            let data = PieChartData(dataSet: dataSet)
                                                        
            pieChart.data = data
                                                        
            pieChart.chartDescription?.text = "Usuarios"
                                                        
            pieChart.holeColor = UIColor.clear
                                                        
            pieChart.chartDescription?.textColor = UIColor.blue
                                                        
            pieChart.legend.textColor = UIColor.blue
                                                        
            pieChart.notifyDataSetChanged()
                                                       */
                                                        
                                              
        /*
        let entry1 = PieChartDataEntry(value: 9, label: "Tanatologo Rebeca")
        let entry2 = PieChartDataEntry(value: 9, label: "Tanatologo Marcia")
        let entry3 = PieChartDataEntry(value: 8, label: "Tanatologo Ian")
        let dataSet = PieChartDataSet(entries: [entry1, entry2,entry3], label: "Usuarios atendidos")
        
        dataSet.colors = ChartColorTemplates.joyful()
        
        let data = PieChartData(dataSet: dataSet)
        
        pieChart.data = data
        
        pieChart.chartDescription?.text = "uSUARIOS ATENDIDOS"
        
        pieChart.holeColor = UIColor.clear
        
        pieChart.chartDescription?.textColor = UIColor.blue
        
        pieChart.legend.textColor = UIColor.blue
        
        pieChart.notifyDataSetChanged()*/
    //}/*
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.*/
    }
    
    
}

