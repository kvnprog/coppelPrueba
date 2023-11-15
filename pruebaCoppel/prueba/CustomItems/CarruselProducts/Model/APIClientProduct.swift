import Firebase

class APIClientProduct {
    
    private let db = Firestore.firestore()
    
    func getDataCategoryFirebase(completion: @escaping (Result<[CarruselCellProductModel], Error>) -> Void) {
        
        let collectionReference = db.collection("productos")
        var carruselCellModelData = [CarruselCellProductModel]()
        var carruselCellModel: CarruselCellProductModel = CarruselCellProductModel(carruselContentProductCellModel: [])
        
        collectionReference.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error al obtener documentos: \(error.localizedDescription)")
                completion(.failure(error))
            } else if let documents = querySnapshot?.documents {
                for document in documents {
                    let documentData = document.data()
                    
                    if let img = documentData["imagen"] as? String,
                       let title = documentData["titulo"] as? String ,
                       let precio = documentData["precio"] as? String,
                       let tipo = documentData["tipo"] as? String,
                       let descuento = documentData["descuento"] as? String{
                        
                        let carruselContentCellModel = CarruselContentCellProductModel(title: title, precio: precio, image: img,tipo: tipo, descuento: descuento)
                        carruselCellModel.carruselContentProductCellModel.append(carruselContentCellModel)
                        
                    }
                }

                carruselCellModelData.append(carruselCellModel)
                completion(.success(carruselCellModelData))
            }
        }
    }
}

