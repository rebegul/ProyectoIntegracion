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
    
    func pieChartUpdate () {
        
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
                                                        
                                                        
                                                        let entry1 = PieChartDataEntry(value: Double(reb), label: "Tanatologo Rebeca")
                                                        let entry2 = PieChartDataEntry(value: Double(mar), label: "Tanatologo Marcia")
                                                        let entry3 = PieChartDataEntry(value: Double(resp), label: "Tanatologo Ian")
                                                        let dataSet = PieChartDataSet(entries: [entry1, entry2,entry3], label: "Usuarios atendidos")
                                                        
                                                        dataSet.colors = ChartColorTemplates.vordiplom()
                                                        
                                                        let data = PieChartData(dataSet: dataSet)
                                                        
                                                        pieChart.data = data
                                                        
                                                        pieChart.chartDescription?.text = "uSUARIOS ATENDIDOS"
                                                        
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
