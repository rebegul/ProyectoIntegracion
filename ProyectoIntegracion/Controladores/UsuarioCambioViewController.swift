//
//  UsuarioCambioViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class UsuarioCambioViewController: UIViewController {
    
    let db = Firestore.firestore()

    @IBOutlet weak var CambioNomU: UITextField!
    
    
    @IBOutlet weak var CambioContraU: UITextField!
    
    @IBOutlet weak var CambioCorrU: UITextField!
    
    
    @IBAction func SaveCambioU(_ sender: Any) {
        
        db.collection("Usuario").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hola = ("\(document.documentID)")
                    
                    let cambiar = Firestore.firestore().collection("Usuario")
                    cambiar.document(hola).setData(["Contraseña":self.CambioContraU.text ?? "", "Correo":self.CambioCorrU.text ?? "", "Nombre":self.CambioNomU.text ?? ""])
                    
            
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
