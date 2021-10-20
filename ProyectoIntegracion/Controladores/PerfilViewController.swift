//
//  PerfilViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import Firebase



class PerfilViewController: UIViewController {
    
    
    @IBOutlet weak var Role: UILabel!
    
    
    
    
    let db = Firestore.firestore()
    
    

    @IBAction func conseguirAdmin(_ sender: Any) {
        
        
        db.collection("Administradores").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hols = ("\(document.data())")
                    self.Role.text = hols
                    print(hols)
                    
            
                }
            }
            
        } //end of previous
        
        
        
    }
    
    @IBAction func conseguirTan(_ sender: Any) {
        
        
        db.collection("Tanatologos").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hols = ("\(document.data())")
                    self.Role.text = hols
                    
            
                }
            }
            
        } //end of previous
        
    }
    
    
    
    @IBAction func conseguirUsuario(_ sender: Any) {
        
        db.collection("Usuario").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents{
                    let hols = ("\(document.data())")
                    self.Role.text = hols
                    
            
                }
            }
            
        }
    }
    
    
    //var tanatologos = [Tanatologos]()
    /*
    private func getAll(){
        db.collection("Tanatologos").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    //var s = Tanatologos(aDoc: document)
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }*/
    
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
