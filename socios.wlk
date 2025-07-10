// Socios:
class Socio {
    const actividades = []     //--> Se debe registrar que actividades realizó
    const maximoDeActividades  //--> Maximo de actividades que puede hacer
    const edad
    const idiomasHablados = #{}
 
    method idiomasHablados() = idiomasHablados

    method esAdoradorDelSol() = actividades.forEach({a => a.sirveParaBroncearse()})

    method actividadesEsforzadas() = actividades.filter({a => a.implicaEsfuerzo()})

    method registrarActividad(unaActividad){
        if(maximoDeActividades >= actividades.size())
            actividades.add(unaActividad)
        else
            self.error("Se superó la cantidad maxima de actividades que puede realizar")
    }

    method leAtrae(unaActividad){}
}

class SocioTranquilo inherits Socio {
    override method leAtrae(unaActividad) = unaActividad.cuantosDiasLleva() >= 4
}

class SocioCoherente inherits Socio {
    override method leAtrae(unaActividad) = 
        if(self.esAdoradorDelSol()) 
            unaActividad.sirveParaBroncearse()
        else
            unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socio {

    //Verifica que la interseccion entre el conj idiomasHablados del socio y el conj idiomas de la activida no este vacio,
    //Si no esta vacio quiere decir que comparten al menos un idioma y que la actividad le atrae al socio.
    
    override method leAtrae(unaActividad) = 
        not self.idiomasHablados().intersection(unaActividad.idiomas()).isEmpty()
}