//
//  Acompa_DetallesViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 12/10/21.
//

import UIKit

class Acompa_DetallesViewController: UIViewController {
    
    var acompa:Acompa?

    @IBOutlet weak var nomAcompa: UILabel!
    
    @IBOutlet weak var descAcompa: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomAcompa.text = acompa?.nombre
        descAcompa.text = acompa?.desc
        imagen.image = UIImage(named: acompa!.imagen)

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
