//
//  AntesCambiarAdminViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 20/10/21.
//

import UIKit
import FirebaseFirestore

class AntesCambiarAdminViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    
    @IBOutlet weak var info: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        conseguirTodos()

        // Do any additional setup after loading the view.
    }
    
    func conseguirTodos(){
        db.collection("Administradores").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hols = ("\(document.data())")
                    self.info.text = hols
                    print(hols)
                    
            
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
