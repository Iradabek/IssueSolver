//
//  HTTPMyQueryRepository.swift
//  Issue Solver
//
//  Created by Valeh Amirov on 09.07.24.
//

import Foundation
import NetworkingPack

final class HTTPQueryRepository {
    
    private var http: HTTPClient = .shared
    
    func getMyQueries(pageCount: String, completion: @escaping (Result<QueryModel, Error>) -> Void) {
        http.GET(endPoint: EndPoint.query(.myQueries(pageCount))) { (data: QueryModel?,error: Error? ) in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func getSingleQuery(id: String, completion: @escaping(Result<SingleQueryModel, Error>) -> Void) {
        http.GET(endPoint: EndPoint.query(.singleQuery(id))) { (data: SingleQueryModel?, error: Error?) in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func postComment(requestID: String, body: PostCommentModel,completion: @escaping(Result<CommentSuccessModel, Error>) -> Void ) {
        http.POST(endPoint: EndPoint.query(.postComment(requestID)), body: JSONConverter().encode(input: body)) { (data: CommentSuccessModel?, error: Error?) in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func deleteSingleQuery(requestID: String,  completion: @escaping( Result<QueryDeleteSuccessModel, Error>) -> Void) {
        http.DELETE(endPoint: EndPoint.query(.deleteQuery(requestID)), body: nil) { (data: QueryDeleteSuccessModel?, error: Error?) in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func getComments(requestID: String, pageCount: String, completion: @escaping( Result<QueryCommentModel, Error>) -> Void) {
        http.GET(endPoint: EndPoint.query(.getQueryComments(requestID, pageCount))) { (data: QueryCommentModel?, error: Error?) in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                completion(.success(data))
            }
        
        }
    }
    
    func postLike(queryID: String, completion: @escaping(Result<SuccessModel, Error>) -> Void) {
        http.POST(endPoint: EndPoint.query(.likePost(queryID)), body: nil) { (data: SuccessModel?, error: Error? )in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                completion(.success(data))
            }
        }
    }
    
    func deleteLike(queryID: String, completion: @escaping(Result<SuccessModel, Error>) -> Void) {
        
        http.DELETE(endPoint: EndPoint.query(.likeDelete(queryID)), body: nil) {(data: SuccessModel?, error: Error? ) in
            if let error {
                completion(.failure(error))
            }
            
            if let data {
                completion(.success(data))
            }
            
        }
    }
}
