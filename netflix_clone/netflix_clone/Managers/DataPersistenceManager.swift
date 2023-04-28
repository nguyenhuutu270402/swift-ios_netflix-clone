//
//  DataPersistenceManager.swift
//  netflix_clone
//
//  Created by Thien on 27/04/2023.
//

import Foundation
import UIKit
import CoreData


class DataPersistenceManager {
    
    enum DatabaseErorr: Error {
        case failedToSaveData
        case failedToFecthData
        case failedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
    func downloadTitleWith(model: Movie, completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        
        item.id = Int64(model.id)
        item.original_title = model.original_title
        item.original_language = model.original_language
        item.media_type = model.media_type
        item.overview = model.overview
        item.popularity = model.popularity!
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.title = model.title
        item.video = model.video!
        item.vote_average = model.vote_average!
        item.vote_count = Int64(model.vote_count!)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print(error.localizedDescription)
            completion(.failure(DatabaseErorr.failedToSaveData))
        }
    }
    
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = TitleItem.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
            
        } catch {
            completion(.failure(DatabaseErorr.failedToFecthData))
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        context.delete(model)
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseErorr.failedToDeleteData))
        }
    }
}
