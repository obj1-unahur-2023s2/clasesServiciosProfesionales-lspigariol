




class ProfesionalAsociado {
	var property universidad
	
	method provinciasDondePuedeTrabajar() = #{"Entre Ríos", "Corrientes", "Santa Fe"} 
	
	method honorariosPorHora() = 3000
	
//	method trabajaEnALoSumo3Provincias() = true
	 
}


// a esta clase le faltan métodos
class ProfesionalVinculado {
	var property universidad
	
	method honorariosPorHora() = universidad.cuantoRecomendasCobrarPorHora()
		
	method provinciasDondePuedeTrabajar() = [universidad.provinciaDondeEstas()]
	
//	method trabajaEnALoSumo3Provincias() = true
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre {
	var property universidad
	var property honorariosPorHora 
	var property provinciasDondePuedeTrabajar
	
//	method trabajaEnALoSumo3Provincias() = provinciasDondePuedeTrabajar.size() <= 3
	
}

class Universidad{
	var cobroRecomendado 
	const provinciaDondeEstas

   method cuantoRecomendasCobrarPorHora() = cobroRecomendado
 	
   method provinciaDondeEstas() = provinciaDondeEstas
   
   
   method inflacion(porc) {
   	cobroRecomendado *= 1 + porc
   }
}
/*
object messi {
	
	
}

*/

class Empresa {
	
	const profesionales = []
	var honorarioReferencia

/*	
	method initialize(){
		self.contratar(messi)
	}
*/
	
	method contratar(p){
		profesionales.add(p)
	}
	
	
//_cuántos (un número) de sus profesionales contratados estudió en una determinada universidad.
	method cuantosEstudiaronEn(uni) 
	    = profesionales.count{p=>p.universidad() == uni}
	 
//- el conjunto formado por sus _profesionales caros_.   
//  O sea, aquellos cuyo honorario es mayor al honorario de referencia de la empresa.
	method profesionalesCaros() 
	    = profesionales.filter{p=>p.honorariosPorHora()> honorarioReferencia}

//- el conjunto de las _universidades formadoras_, o sea, las universidades donde estudiaron sus profesionales contratados, sin repetidos.
	method universidadesFormadoras() 
	    = profesionales.map{p=>p.universidad()}.asSet()
	
//- el profesional _más barato_ (o sea, que sus honorarios son los más bajos).
	method profesionalMasBarato() 
		= profesionales.min{p=>p.honorariosPorHora()} 
		
//- si _es de gente acotada todos trabajan en a lo sumo tres provincias).
	method esDeGenteAcotada() 
	    = profesionales.all{p=>p.provinciasDondePuedeTrabajar().size()<=3}
//	    = profesionales.all{p=>p.trabajaEnALoSumo3Provincias()}
	
	
}
