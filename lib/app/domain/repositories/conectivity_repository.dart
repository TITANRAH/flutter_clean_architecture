abstract class ConectivityRepository {
  Future<bool> get hasInternet;

}

// cuado son abstractas podemos definir funciones o getter que no rtengan cuerpo 
// el cuerpo sera creado en el repositorio