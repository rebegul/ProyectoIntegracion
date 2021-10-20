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
                                                        
                                                        
                                                        let entry1 = PieChartDataEntry(value: Double(acom), label: "Acompañamiento")
                                                        let entry2 = PieChartDataEntry(value: Double(hol), label: "Holistico")
                                                        let entry3 = PieChartDataEntry(value: Double(alt), label: "Alternativas")
                                                        let dataSet = PieChartDataSet(entries: [entry1, entry2,entry3], label: "Tipo de servicios")
                                                        
                                                        dataSet.colors = ChartColorTemplates.pastel()
                                                        
                                                        let data = PieChartData(dataSet: dataSet)
                                                        
                                                        pieChart.data = data
                                                        
                                                        pieChart.chartDescription?.text = "Tipo de servicios"
                                                        
                                                        pieChart.holeColor = UIColor.clear
                                                        
                                                        pieChart.chartDescription?.textColor = UIColor.blue
                                                        
                                                        pieChart.legend.textColor = UIColor.blue
                                                        
                                                        pieChart.notifyDataSetChanged()
                                                        
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
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

