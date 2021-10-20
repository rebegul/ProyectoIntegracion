//
//  Holistico_DetallesViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 12/10/21.
//

import UIKit

class Holistico_DetallesViewController: UIViewController {
    
    var holistico:Holistico?

    @IBOutlet weak var nomHol: UILabel!
    
    
    @IBOutlet weak var imagenH: UIImageView!
    @IBOutlet weak var descHol: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomHol.text = holistico?.nombre
        descHol.text = holistico?.desc
        imagenH.image = UIImage(named: holistico!.imagen)

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
