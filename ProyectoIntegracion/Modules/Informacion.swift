//
//  Informacion.swift
//  ProyectoIntegracion
//
//  Created by Rebeca Guevara on 12/10/21.
//

import Foundation

struct Informacion{
    var nombre:String
    var desc:String
    var imagen:String
    init(nombre:String, desc:String, imagen:String){
        self.nombre = nombre
        self.desc = desc
        self.imagen = imagen
    }
}


extension Informacion{
    static func listaInformacion()->[Informacion]{
        return [
            Informacion(nombre: "Misión", desc:"Acompañar, guiar y encauzar a personas, pacientes con alguna enfermedad y a sus familiares a través de la tanatología mejorando su estado emocional, físico, psicológico y espiritual logrando reencuentren un sentido a la vida asumiendo nuestro compromiso y calidad humana con cada uno de ellos.", imagen: "Infocetac"),
            Informacion(nombre: "Visión", desc:"Ser la mejor opción en el servicio en tanatología en la Ciudad de México ampliando nuestros servicios en el interior de la República Mexicana asumiendo nuestro compromiso de ofrecer beneficios a las personas con calidez humana.", imagen: "Infocetac"),
            Informacion(nombre: "Valores", desc: "Respeto: Dar valía a la ideología de cada individuo respetando sus creencias,estatus económico o género. \n Honestidad:  Conducirnos con la verdad y transparencia  con todos los individuos, asociados y aliados. \n Empatía: Reconocer, comprender y apreciar las emociones y sentimientos de los demás. \nIntegridad:  Conducirnos con rectitud y ética en las ideas, creencias y comportamientos   de   nuestros   colaboradores   con   la   interacción   con   la comunidad. \nHumildad:  Tener la sabiduría de reconocer  y respetar  las habilidades, cualidades, capacidades y aptitudes del ser humano.", imagen: "Infocetac"),
            Informacion(nombre: "Objetivos", desc: "Apoyar a personas de escasos recursos con algún tipo de discapacidad para satisfacer sus necesidades humanas de acuerdo a la pirámide de Maslow: fisiológicas, de seguridad, de pertenencia, reconocimiento y autorrealización, a través de la disciplina de tanatología.", imagen: "Infocetac"),
           
        ]
        
    }
    
    
}
