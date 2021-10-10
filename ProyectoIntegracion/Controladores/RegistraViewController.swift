//
//  RegistraViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegistraViewController: UIViewController {

    @IBOutlet weak var nombre: UITextField!
    
    @IBOutlet weak var correo: UITextField!
    
    @IBOutlet weak var contrase: UITextField!
    
    //var ref: DatabaseReference!
    
    //Clet ref = Database.database().reference()
    
    let db = Firestore.firestore()
    @IBAction func guardarTan(_ sender: Any) {
   
        db.collection("Tanatologos").addDocument(data: ["Contraseña":contrase.text ?? "", "Correo":correo.text ?? "","Nombre":nombre.text ?? "" ])
    }
    
    @IBAction func guardarAdmin(_ sender: Any) {
        
        db.collection("Administradores").addDocument(data: ["Contraseña":contrase.text ?? "", "Correo":correo.text ?? "","Nombre":nombre.text ?? "" ])
        
        
    }
    
    
    @IBAction func guardarUsuario(_ sender: Any) {
        db.collection("Usuario").addDocument(data: ["Contraseña":contrase.text ?? "", "Correo":correo.text ?? "","Nombre":nombre.text ?? "" ])
        
        
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
