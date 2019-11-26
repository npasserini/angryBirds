object islaCerdito {
	const obstaculos = []
	
	method addObstaculo(obstaculo) { obstaculos.add(obstaculo) }	

	method obstaculoMasCercano() = obstaculos.find {
		obstaculo => not obstaculo.derribado()
	}	
	
	method seDerribaronTodosLosObstaculos() = obstaculos.all {
		obstaculo => obstaculo.derribado()
	}
}

class Obstaculo {
	var property derribado = false
}

class Pared inherits Obstaculo {
	const ancho
	
	method resistencia() = ancho * self.resistenciaPorMetro()
	method resistenciaPorMetro()
	
	method recibirImpacto(pajaro) {
		derribado = true
	}
}

class ParedVidrio inherits Pared {
	override method resistenciaPorMetro() = 10
}

class ParedMadera inherits Pared {
	override method resistenciaPorMetro() = 20
}

class ParedPiedra inherits Pared {
	override method resistenciaPorMetro() = 50
}

class Cerdito inherits Obstaculo {
	
	method resistencia() = 50
	
	method recibirImpacto(pajaro) { 
		if (pajaro.ira() > 10) {
			derribado = true
		}
	}
}

class CerditoArmado inherits Obstaculo {
	var equipamiento // Casco o escudo
	const property horasDeEntrenamiento
	
	method resistencia() = equipamiento.resistencia(self)
	
	method recibirImpacto(pajaro) {
		equipamiento.recibirImpacto(self)
	}
	
	method perderEquipamiento() {
		equipamiento = sinEquipamiento
	}
}

object sinEquipamiento {
	method resistencia(cerdito) = 10 

	method recibirImpacto(cerdito) {
		cerdito.derribado(true)
	}
}

class Casco {
	method resistencia(cerdito) = 100

	method recibirImpacto(cerdito) {
		cerdito.perderEquipamiento()
	}
}

class Escudo {
	const impactosQueResiste
	var impactosRecibidos = 0
	
	method resistencia(cerdito) = 5 * cerdito.horasDeEntrenamiento()
	
	method recibirImpacto(cerdito) {
		impactosRecibidos += 1
		if (impactosQueResiste < impactosRecibidos) {
			cerdito.perderEquipamiento()
		}
	}
}
