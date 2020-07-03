import plantas.*

class Parcela {
	
	var property ancho = 0
	var property largo = 0
	var property horasDeSolAlDia = 0
	var property plantas = []	
	
		
	
	method superficie(){
		return ancho * largo
	}
	
	method cantidadMaxima(){
		return if (ancho > largo) { self.superficie() / 5 }
			else { self.superficie() / 3 + largo  }
	}
	
	method tieneSangreJoven(){
		return plantas.any({ planta => planta.anioDeObtencion() > 2012})
	}
	
	method plantar(unaPlanta){
		if (plantas.size() == self.cantidadMaxima() or 
			(self.horasDeSolAlDia() - unaPlanta.horasDeSol()>2)){
				self.error("No se puede plantar.")
			}
		else { plantas.add(unaPlanta)}	
	}
	
	method cantidadDeBienAsociadas(){
		return plantas.count({planta=>planta.seAsociaBienA(self)})
	}
	
	method porcentajeDeBienAsociadas(){
		return (self.cantidadDeBienAsociadas()*100)/self.cantidadDePlantas()
	}
	
	method cantidadDePlantas(){
		return plantas.size()
	}
	
	method tieneMasDe(unNumero){
		return self.cantidadDePlantas()>unNumero
	}
}	
class ParcelaEcologica inherits Parcela{	
	
	method asociaBienPara(unaPlanta){
		return self.tieneSangreJoven() and unaPlanta.parcelaIdeal(self) 
	}
}
class ParcelaIndustrial inherits Parcela{	
	
	method asociaBienPara(unaPlanta){
		return plantas.size() <= 2 and unaPlanta.esFuerte()
	}
}

