import Firebase

class APIClientBrand {
    
    private let db = Firestore.firestore()
    
    func getDataCategoryFirebase(completion: @escaping (Result<[CarruselBrandCellModel], Error>) -> Void) {
        
        let collectionReference = db.collection("marcas")
        var carruselCellModelData = [CarruselBrandCellModel]()
        var carruselCellModel: CarruselBrandCellModel = CarruselBrandCellModel(carruselContentBrandCellModel: [])
        
        collectionReference.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error al obtener documentos: \(error.localizedDescription)")
                completion(.failure(error))
            } else if let documents = querySnapshot?.documents {
                for document in documents {
                    let documentData = document.data()
                    
                    if let img = documentData["imagen"] as? String
                       {
                        let carruselContentCellModel = CarruselContentBrandCellModel( image: img)
                        carruselCellModel.carruselContentBrandCellModel.append(carruselContentCellModel)
                        
                    }
                }
                
                carruselCellModelData.append(carruselCellModel)
                completion(.success(carruselCellModelData))
            }
        }
    }
}

