class Pajaro {
	var ira
	var cantMedallas = 0
	
	method ira() = ira
	
	method fuerza() = self.fuerzaPropia() + self.fuerzaPorMedallas()
	
	method fuerzaPropia()
	
	method enojarse() { ira *= 2 }
	method enojarseVeces(cuantasVeces) {
		cuantasVeces.times { _ => self.enojarse() }
	}
	
	method esFuerte() = self.fuerza() > 50
	
	method tranquilizar() { ira -= 5 }
	
	method puedeImpactar(obstaculo) = self.fuerza() > obstaculo.resistencia()
	
	method lanzarA(isla) {
		const obstaculo = isla.obstaculoMasCercano()
		if (self.puedeImpactar(obstaculo)) 
			obstaculo.recibirImpacto(self)
	} 

	method otorgarMedalla() { cantMedallas += 1 }
	
	method fuerzaPorMedallas() = cantMedallas * 15
	
	method esMasFuerteQue(otro) = self.fuerza() > otro.fuerza()
}

class PajaroComun inherits Pajaro {
	override method fuerzaPropia() = ira * 2
}

class Red inherits Pajaro {
	var cantEnojos = 0
	
	override method fuerzaPropia() = 10 * cantEnojos
	
	override method enojarse() {
		super()
		cantEnojos += 1
	}
} 

class Bomb inherits Pajaro {
	override method fuerzaPropia() = (10 * ira).min(9000)
}

class Chuck inherits Pajaro {
	var velocidad
	
	override method fuerzaPropia() = 150 + 5 * self.excesoDeVelocidad()
	method excesoDeVelocidad() = (velocidad - 80).max(0)
	
	override method enojarse() {
		super()
		velocidad *= 2
	} 
	
	override method tranquilizar() {}
}

class Matilda inherits Pajaro {
	const property fuerzaPropia
	
	method lanzarA(isla) {
		new Huevo().lanzarA(isla)
	}
}

class Huevo {
	method ira() = ???	
}