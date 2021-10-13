//
//  TanatolCambioViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class TanatolCambioViewController: UIViewController {

    let db = Firestore.firestore()
    @IBOutlet weak var CambioNombreTan: UITextField!
    
    @IBOutlet weak var CambC: UITextField!
    
    @IBOutlet weak var CambioContraTan: UILabel!
    @IBOutlet weak var CambioCorreoTan: UITextField!
    
   
    @IBAction func SAVETAN(_ sender: Any) {
        db.collection("Tanatologos").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hols = ("\(document.documentID)")
                    
                    let cambiar = Firestore.firestore().collection("Tanatologos")
                    cambiar.document(hols).setData(["Contraseña":self.CambC.text ?? "", "Correo":self.CambioCorreoTan.text ?? "", "Nombre":self.CambioNombreTan.text ?? ""])
                    
            
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
