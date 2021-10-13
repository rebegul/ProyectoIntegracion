//
//  Holistico.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 12/10/21.
//

import Foundation

struct Holistico{
    var nombre:String
    var desc:String
    init(nombre:String, desc:String){
        self.nombre = nombre
        self.desc = desc
    }
}


extension Holistico{
    static func listaHolistico()->[Holistico]{
        return [
            Holistico(nombre: "Aromaterapia y Musicoterapia", desc:"En un espacio y ambiente de tranquilidad la persona vive un estado de bienestar físico, emocional y mental mediante el uso controlado de los aromas de nuestras esencias combinado con musicoterapia transportando al individuo a un ambiente de armonía y sensación de calma y relajación con el fin de ayudar a equilibrar cambios de estado de ánimo y de energía corporal."),
            Holistico(nombre: "Cristaloterapia", desc:"Es una terapia energética que equilibra el cuerpo desde la parte física, emocional y espiritual. Se trabaja en el conjunto de chakras ubicado a lo largo de la columna vertebral hasta el cerebro. Esta energía circula a través de la persona y representa el conjunto de experiencias de distintos niveles y se almacena a lo largo de su vida y en ocasiones se encuentra bloqueada. Ayudamos a que esa energía fluya en el individuo pararestablecer la armonía y conexión con su mente, sus emociones, su cuerpo y su espíritu."),
            Holistico(nombre: "Reiki", desc:"Es un método de canalización y transmisión de energía vital para que la persona obtenga paz y equilibrio físico, mental, emocional y espiritual."),
            Holistico(nombre: "Biomagnetismo", desc: "Es un método que busca el equilibrio en emociones, mente y energía a través de colocación de imanes en posiciones estratégicas en el cuerpo para lograr una vida más próspera y saludable."),
            Holistico(nombre: "Angeloterapia", desc: "Es una herramienta que te ayuda a trabajar tu autoestima, a darte cuenta de todo tu potencial; te ayuda a ver lo maravilloso y perfecto ser humano   que   eres   y   que   no   hay   obstáculos   que   no   puedas   superar enfocándonos en una visión siempre positiva y optimista."),
            Holistico(nombre: "Cama térmica de Jade", desc: "El calor que expide la cama térmica con regulación de temperatura y la musicoterapia en conjunto, la persona es transportada a un ambiente de armonía y sensación de calma y relajación de los diferentes músculos de cuerpo con el fin de ayudar a equilibrar cambios de estado de ánimo y de energía corporal.")
           
        ]
        
    }
    
    
}
