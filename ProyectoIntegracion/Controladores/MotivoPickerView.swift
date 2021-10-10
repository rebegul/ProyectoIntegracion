//
//  MotivoPickerView.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 09/10/21.
//

import UIKit

class MotivoPickerView: UIPickerView{

    let servicios = ["Sad", "Depresion", "Breakup"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return servicios.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return servicios[row]
    }
    
    func getSelected(_ pickerView: UIPickerView, selectedRow row: Int) -> String? {
        return servicios[row]
    }


}
