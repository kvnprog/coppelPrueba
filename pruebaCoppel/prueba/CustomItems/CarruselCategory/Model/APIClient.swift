import Firebase

class APIClient {
    
    private let db = Firestore.firestore()
    
    func getDataCategoryFirebase(completion: @escaping (Result<[CarruselCellModel], Error>) -> Void) {
        
        let collectionReference = db.collection("categorias")
        var carruselCellModelData = [CarruselCellModel]()
        var carruselCellModel: CarruselCellModel = CarruselCellModel(carruselContentCellModel: [])

        collectionReference.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error al obtener documentos: \(error.localizedDescription)")
                completion(.failure(error))
            } else if let documents = querySnapshot?.documents {
                for document in documents {
                    let documentData = document.data()
                    
                    if let img = documentData["imagen"] as? String,
                       let title = documentData["titulo"] as? String {
                        
                        let carruselContentCellModel = CarruselContentCellModel(title: title, image: img)
                        carruselCellModel.carruselContentCellModel.append(carruselContentCellModel)
                    }
                }
                
                carruselCellModelData.append(carruselCellModel)
                completion(.success(carruselCellModelData))
            }
        }
    }
}
