//
//  AdminCambiosViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class AdminCambiosViewController: UIViewController {
    
    let db = Firestore.firestore()

    @IBOutlet weak var CambioNombre: UITextField!
    
    @IBOutlet weak var CambioContra: UITextField!
    
    @IBOutlet weak var CambioCorreo: UITextField!
    
    @IBAction func SaveNOMBREcam(_ sender: Any) {
        //print("hola")
        //self.ref.child("Administradores").setValue(["Nombre":CambioNombre])
        //db.collection("Administradores").setData(["nombre":""])
        
        db.collection("Administradores").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hols = ("\(document.documentID)")
                    
                    let cambiar = Firestore.firestore().collection("Administradores")
                    cambiar.document(hols).setData(["Contraseña":self.CambioContra.text ?? "", "Correo":self.CambioCorreo.text ?? "", "Nombre":self.CambioNombre.text ?? ""])
                    
            
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
