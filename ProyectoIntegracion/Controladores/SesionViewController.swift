//
//  SesionViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class SesionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return motivoPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return motivoPicker.count
    }
    
   
    
    let db = Firestore.firestore()

    //@IBOutlet weak var Motivo: MotivoPickerView!
    
    @IBOutlet weak var NombreSesion: UITextField!
    //var motivoPicker: [String]=[String]()
    
    @IBOutlet weak var Date: UITextField!
    @IBOutlet weak var Intervencion: UITextField!
    @IBOutlet weak var Tipo: UITextField!
    //@IBOutlet weak var Motivo: UITextField!
    @IBOutlet weak var Cuota: UITextField!
    @IBOutlet weak var Evaluacion: UITextField!
    
    @IBOutlet weak var Motivo: UIPickerView!
    
    @IBOutlet weak var Herramientas: UITextField!
    @IBOutlet weak var NimbreTan: UITextField!
    
    var motivoPicker:[String]=[String]()
    
    
    
    @IBAction func GuardarSesion(_ sender: Any) {
        
        db.collection("Sesiones").addDocument(data: ["Cuota":Cuota.text ?? "", "Evaluación":Evaluacion.text ?? "","Herramientas":Herramientas.text ?? "", "Tipo de Intervención":Intervencion.text ?? "", "Tipo de servicio":Tipo.text ?? "", //"Motivo":Motivo.text ?? "",
                                                     "Tanatologo":NimbreTan.text ?? "","Nombre Usuario":NombreSesion.text ?? "",  "Fecha":Date.text ?? "" ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Motivo.delegate = self
        self.Motivo.dataSource = self
        
        motivoPicker = ["dolor", "sufrimiento", "tf"]

        // Do any additional setup after loading the view.
        
        //self.picker.delegate = self
        //self.picker.dataSource = self
        
        
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
