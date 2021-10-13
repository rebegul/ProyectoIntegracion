//
//  CambioSesionViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class CambioSesionViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    
    @IBOutlet weak var CambioTan: UITextField!
    
    @IBOutlet weak var NomCamb: UITextField!
    
    @IBOutlet weak var CAMdATE: UITextField!
    
    @IBOutlet weak var CamMot: UITextField!
    @IBOutlet weak var CuoCam: UITextField!
    
    @IBOutlet weak var CamInter: UITextField!
    @IBOutlet weak var CamHerramientas: UITextField!
    @IBOutlet weak var CamTipo: UITextField!
    @IBOutlet weak var EvaCam: UITextField!
    
    @IBAction func ChangeSesion(_ sender: Any) {
        db.collection("Sesiones").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hols = ("\(document.documentID)")
                    
                    let cambiar = Firestore.firestore().collection("Sesiones")
                    cambiar.document(hols).setData(["Cuota":self.CuoCam.text ?? "", "Evaluación":self.EvaCam.text ?? "","Herramientas":self.CamHerramientas.text ?? "", "Tipo de Intervención":self.CamInter.text ?? "", "Tipo de servicio":self.CamTipo.text ?? "", "Motivo":self.CamMot.text ?? "",  "Tanatologo":self.CambioTan.text ?? "","Nombre Usuario":self.NomCamb.text ?? "",  "Fecha":self.CAMdATE.text ?? "" ])
                    
            
                }
            }
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
