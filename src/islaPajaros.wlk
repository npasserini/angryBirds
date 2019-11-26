object islaPajaros {
	const property pajaros = []	

	method addPajaro(pajaro) { pajaros.add(pajaro) }
		
	method pajarosFuertes() = pajaros.filter { pajaro => pajaro.esFuerte() }
	
	method fuerza() = self.pajarosFuertes().sum { pajaro => pajaro.fuerza() }
	
	method atacar(isla) {
		pajaros.forEach { pajaro => 
			if (not isla.seDerribaronTodosLosObstaculos()) {
				pajaro.lanzarA(isla)				
			} 
		}
	}
}

class SesionDeManejoDeLaIra {
	method iniciar(isla) {
		isla.pajaros().forEach { pajaro => pajaro.tranquilizar() }
	}
}

class InvasionDeCerditos { 
	const cantCerditos
	
	method iniciar(isla) {
		const cantEnojos = cantCerditos.div(100)
		isla.pajaros().forEach { pajaro => pajaro.enojarseVeces(cantEnojos) }
	}
}

class FiestaSorpresa {
	const homenajeados
	
	method iniciar(isla) {
		self.validarQueEstenTodosLosHomenajeados(isla)
		homenajeados.forEach { pajaro => pajaro.enojarse() }
		
	}
	
	method validarQueEstenTodosLosHomenajeados(isla) {
		if (not self.estanTodos(homenajeados)) {
			self.error("No podemos homenajear")
		}
	}

	method estanTodos(isla) = 
		homenajeados.all { pajaro => isla.pajaros().contains(pajaro) } 
}

class SerieDeEventosDesafortunados {
	const eventos 
	
	method iniciar(isla) {
		eventos.forEach { evento => evento.iniciar(isla) }
	}
}

class PremioAlMasFuerte {
	method iniciar(isla) {
		const pajaroMasFuerte = isla.pajaros().max { pajaro => pajaro.fuerza() }
		
		const esUnico = isla.pajaros().all { otro => 
			pajaroMasFuerte.esMasFuerteQue(otro) 
			or pajaroMasFuerte == otro
		}
		
		if (esUnico) pajaroMasFuerte.otorgarMedalla()
	}
}