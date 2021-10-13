//
//  CETAC_DetallesViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 12/10/21.
//

import UIKit

class CETAC_DetallesViewController: UIViewController {
    var informacion:Informacion?

    @IBOutlet weak var nombreinformacion: UILabel!
    
    @IBOutlet weak var descInfo: UILabel!
    
    
    
    @IBOutlet weak var imagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreinformacion.text = informacion?.nombre
        descInfo.text = informacion?.desc
        
        imagen.image = UIImage(named: informacion!.imagen)

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
