import plantas.*
import Parcelas.*

object inta {
	
	const property parcelas = #{}
	
	method promedioDePlantas(){
		return parcelas.sum({par=>par.cantidadDePlantas()}) / self.cantidadDeParcelas()
	}
	
	method cantidadDeParcelas(){
		return parcelas.size()
	}
	
	method masAutosustentable(){
		return parcelas.any({par=>par.tieneMasDe(4)}) and self.mejorAsociada()
	}
	
	
	method mejorAsociada(){
		return parcelas.max({par=>par.porcentajeDeBienAsociadas()})
	}
}
