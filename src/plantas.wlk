class Plantas {
	
	var property anioDeObtencion
	var property altura = 0
	
	method horasDeSol() { return 7 }
	method esFuerte() { return self.horasDeSol() > 9 }
	method daSemillas() { return self.esFuerte() }
	method espacioQueOcupa()
	method parcelaIdeal(unaparcela)
	
	method seAsociaBienA(unaParcela){
		return unaParcela.asociaBienPara(self) 
	}	
}

class Menta inherits Plantas {
	
	override method daSemillas(){
		return super() or self.altura() > 0.4
	}
	
	override method espacioQueOcupa(){
		return altura + 1
	}
	
	override method parcelaIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}
}

class Soja inherits Plantas  {
	
	override method  horasDeSol(){
		return if (self.altura() < 0.3){ 6 }
        else if (self.altura().between(0.3, 0.8)){ 7 }
        else { 12 }
    }
    
    override method daSemillas() { 
        return super() or self.anioDeObtencion() > 2007 and 
        self.altura().between(0.75, 0.9)
    }
    
    override method espacioQueOcupa() {
    	return self.altura() / 2
    }
    override method parcelaIdeal(unaParcela){
    	return unaParcela.horasDeSolAlDia() == self.horasDeSol()
    }
}

class Quinoa inherits Plantas{
		
    const property espacioQueOcupa = 0

    override method horasDeSol(){
        return if (espacioQueOcupa < 0.3) { 10 }
        	   else { super() }
    }

    override method daSemillas(){
        return super() or self.anioDeObtencion() < 2005
    }
    
    override method parcelaIdeal(unaParcela){
    	return unaParcela.plantas().any({planta=>planta.altura()<=1.5})
    }
    
}
	
class SojaTrans inherits Soja{
	
	override method daSemillas() { return false }
	
	override method parcelaIdeal(unaParcela){
        return unaParcela.plantas().size() == 1
    }
}

class Hierbabuena inherits Menta {
	
	override method espacioQueOcupa(){ return super() * 2 }
}

