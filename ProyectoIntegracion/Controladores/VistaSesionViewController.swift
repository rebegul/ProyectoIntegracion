//
//  VistaSesionViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class VistaSesionViewController: UIViewController {
    
    
    @IBOutlet weak var VerSesion: UILabel!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func RecuperarSesion(_ sender: Any) {
        
        db.collection("Sesiones").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hols = ("\(document.data())")
                    self.VerSesion.text = hols
                    
            
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
