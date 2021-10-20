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
    
    func recuperardatos (nombre: String, completion: @escaping (Result<Int, Error>) -> Void) {
        //var cuantos: String
        var resp:Int = 1
        
        db.collection("Sesiones").whereField("Tanatologo", isEqualTo: nombre)
            .getDocuments() { [self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    completion (.failure(err))
                } else {
                    
                    for document in querySnapshot!.documents {
                        
                        if resp > 0{
                            resp += 1
                        }
                        //resp = resp+1
                        //let resp = document.data().count
                        //let resp = document.data().count
                        //print(resp)
                        //print(resp)
                        //completion(.success(resp))
                    }
                    let maybe = resp
                    completion(.success(maybe))
                
                }
                
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
    
    var Tan:Int = 0
    
    func pieChartUpdate () {
        
       
        
        recuperardatos(nombre: "Ian Sánchez"){
            
            
            (resultado) in
            //resultado : [String:Int] = [:]
            switch resultado{
            case .success(let exito):print(resultado)
            case .failure(let error):print(error)
            }
            
           
            
        }
        
        /*
        recuperardatos(nombre: "Marcia Lechuga"){
            (resultado) in
            switch resultado{
            case .success(let exito):print(exito)
            case .failure(let error):print(error)
            }
            
        }*/
        
        /*
        
        db.collection("Sesiones").whereField("Tanatologo", isEqualTo: "Ian Sánchez")
            .getDocuments() { [self] (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        let resp = document.data().count
                        print(resp)
                        
                        
                        db.collection("Sesiones").whereField("Tanatologo", isEqualTo: "Rebeca Guevara")
                            .getDocuments() { [self] (querySnapshot, err) in
                                if let err = err {
                                    print("Error getting documents: \(err)")
                                } else {
                                    for document in querySnapshot!.documents {
                                        
                                        let reb = document.data().count
                                        print(reb)
                                        
                                        
                                        db.collection("Sesiones").whereField("Tanatologo", isEqualTo: "Marcia Lechuga")
                                            .getDocuments() { [self] (querySnapshot, err) in
                                                if let err = err {
                                                    print("Error getting documents: \(err)")
                                                } else {
                                                    for document in querySnapshot!.documents {
                                                        
                                                        let mar = document.data().count
                                                        print(mar)
                                                        */
                                                        
                    let entry1 = PieChartDataEntry(value: 1, label: "Tanatologo Rebeca")
                    let entry2 = PieChartDataEntry(value: 2, label: "Tanatologo Marcia")
                    let entry3 = PieChartDataEntry(value: 3, label: "Tanatologo Ian")
                    let dataSet = PieChartDataSet(entries: [entry1, entry2,entry3], label: "Usuarios atendidos")
                                                        
              dataSet.colors = ChartColorTemplates.vordiplom()
                                                        
                                                        let data = PieChartData(dataSet: dataSet)
                                                        
                                                        pieChart.data = data
                                                        
                                                        pieChart.chartDescription?.text = "uSUARIOS ATENDIDOS"
                                                        
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
        }*/
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
