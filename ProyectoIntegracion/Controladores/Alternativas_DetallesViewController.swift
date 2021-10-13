//
//  Alternativas_DetallesViewController.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 12/10/21.
//

import UIKit

class Alternativas_DetallesViewController: UIViewController {
    
    var alternativas:Alternativas?

    @IBOutlet weak var nomAlt: UILabel!
    
    
    @IBOutlet weak var descAlt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nomAlt.text = alternativas?.nombre
        descAlt.text = alternativas?.desc
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
