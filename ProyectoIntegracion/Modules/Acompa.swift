//
//  Acompa.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 12/10/21.
//

import Foundation

struct Acompa{
    var nombre:String
    var desc:String
    init(nombre:String, desc:String){
        self.nombre = nombre
        self.desc = desc
    }
}

extension Acompa{
    static func listaAcompa()->[Acompa]{
        return [
            Acompa(nombre: "Tanayologóa", desc:"Proceso de encuentro personal en donde a través de un diálogo con la ayuda de técnicas y herramientas tanatológicas la persona identifica y reconoce sus emociones ante una pérdida"),
            Acompa(nombre: "Acompañamiento Individual", desc:"Proceso individual en donde se crea un vínculo de afecto y confianza, la persona se siente escuchada, comprendida, respetada y aceptada. Se busca resignificar su propia vida de alguna situación que está viviendo o vivió (miedos, violencia, dudas, inseguridades, bloqueos, vicios, etc.) con el fin de ayudarlos a desarrollar soluciones en su propio beneficio y vivir el aquí y el ahora."),
            Acompa(nombre: "Acompañamiento Grupal", desc: "Proceso en donde las personas no se enjuician, se comparten las experiencias que al mismo tiempo está siendo vivida por el resto de los participantes. Se crean lazos de confianza, compasión, empatía y aceptación en un espacio seguro en donde se es libre de comunicar y dar solución ante una situación"),
            Acompa(nombre: "Logoterapia", desc: "Proceso para guiar a la persona en su búsqueda del sentido de vida y permite descubrir la capacidad que tienen los humanos para superar los condicionamientos más difíciles “sanar a través del sentido”. Sanar, cuidar, acompañar lo que implica buscar sentido y esencia para vivir en plenitud"),
            Acompa(nombre: "Mindfulnes", desc: "Es una práctica que ayuda a la persona a enfocarse en el presente reconociendo que puede pasar por momentos de estrés, momentos de crisis laboral y personal, de baja autoestima y depresión. A través de herramientas de autoconocimiento, autoreconocimiento y autocontrol podemos entrenar la mente para tener una actitud de apertura, aceptación y solución en cualquier situación de nuestra vida para un balance y dominio emocional.")
           
        ]
        
    }
    
    
}
