// Viajes:
class Viaje {
    const idiomasUsados = #{}

    method idiomas() = idiomasUsados

    method sirveParaBroncearse() = true

    method esInteresante() = idiomasUsados.size() > 1

    method implicaEsfuerzo() = true
    
    method esRecomendadaPara(unSocio) = self.esInteresante() and 
                                        unSocio.leAtrae(self) and !unSocio.actividades().contains(self)
}

class ViajePlaya inherits Viaje{
    const largo

    override method implicaEsfuerzo() = largo > 1200

    method cuantosDiasLleva() = largo / 500
}


class ExcursionCiudad inherits Viaje {
    const cantidadAtracciones

    override method implicaEsfuerzo() = cantidadAtracciones.between(5, 8)

    override method sirveParaBroncearse() = false

    method cuantosDiasLleva() = cantidadAtracciones /2

    override method esInteresante() = super() or cantidadAtracciones == 5
}

class ExcursionCiudadTropical inherits ExcursionCiudad{
    override method cuantosDiasLleva() = super() + 1
}


class SalidaTrekking inherits Viaje{
    const kilometros                   //--> kilimeotros de sendero a recorrer
    const diasDeSol                    //--> Dias de sol por año que tiene el lugar donde se realiza

    override method implicaEsfuerzo() = kilometros > 80

    override method sirveParaBroncearse() = diasDeSol > 200 or (diasDeSol.between(100, 200) and kilometros > 120)

    method cuantosDiasLleva() = kilometros / 50

    override method esInteresante() = super() and diasDeSol > 140
}


class Gimnacia inherits Viaje {

    override method idiomas() = #{"español"}

    method cuantosDiasLleva() = 1

    override method sirveParaBroncearse() = false

    override method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)
}


class TallerLiterario inherits Viaje {
    const libros = #{}

    //Retorna todos los idiomas de cada libro y lo convierte en conj con .asSet()
    override method idiomas() = libros.map({l => l.idioma()}).asSet()

    override method sirveParaBroncearse() = false

    method cuantosDiasLleva() = libros.size() + 1

    override method esRecomendadaPara(unSocio) = unSocio.idioma().size() > 1

    override method implicaEsfuerzo() = libros.any({l => l.cantidadPaginas() > 500}) or
                                        //Verifica que todos los libros de la coleccion tengan el mismo autor
                                        libros.all({l => l.autor()}) and 
                                        libros.size() > 1
}

class Libro {
    const property idioma
    const property cantidadPaginas
    const property autor
}