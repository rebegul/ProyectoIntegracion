//
//  Alternativas.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 12/10/21.
//

import Foundation

struct Alternativas{
    var nombre:String
    var desc:String
    init(nombre:String, desc:String){
        self.nombre = nombre
        self.desc = desc
    }
}

extension Alternativas{
    static func listaAlternativas()->[Alternativas]{
        return [
            Alternativas(nombre: "Flores de Bach", desc:"Ayuda a reestablecer el equilibrio emocional y energético mediante extractos naturales extraídos de flores silvestres con el fin de relajar y aliviar la mente en situaciones de duelo, ansiedad, miedos, stress, entre otros. No tienen efectos secundarios y sin problema se pueden utilizar mientras consumes otros medicamentos. Contamos con 38 soluciones naturales"),
            Alternativas(nombre: "Brisas Ambientales", desc:"Aromatizantes   ambientales   con   propiedades   de aromaterapia que, a través del olfato, estimula el sistema nervioso central ofreciendo resultados positivos en el manejo de las emociones. Se cuenta con brisas relajantes, brisas reanimante y brisas equilibrantes"),
            
           
        ]
        
    }
    
    
}
