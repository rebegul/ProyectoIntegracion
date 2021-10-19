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


    @IBAction func botonExtra(_ sender: Any) {
        
        db.collection("Sesiones").whereField("Motivo", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
    }
    
    
    
    
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
        
        let entry1 = PieChartDataEntry(value: 12, label: "Tanatologo 1")
        let entry2 = PieChartDataEntry(value: 15, label: "Tanatologo 2")
        let entry3 = PieChartDataEntry(value: 18, label: "Tanatologo 3")
        let dataSet = PieChartDataSet(entries: [entry1, entry2,entry3], label: "Usuarios atendidos")
        
        dataSet.colors = ChartColorTemplates.joyful()
        
        let data = PieChartData(dataSet: dataSet)
        
        pieChart.data = data
        
        pieChart.chartDescription?.text = "uSUARIOS ATENDIDOS"
        
        pieChart.holeColor = UIColor.clear
        
        pieChart.chartDescription?.textColor = UIColor.blue
        
        pieChart.legend.textColor = UIColor.blue
        
        pieChart.notifyDataSetChanged()
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
