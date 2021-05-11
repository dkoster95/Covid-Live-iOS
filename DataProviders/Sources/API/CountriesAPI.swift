//
//  CountriesAPI.swift
//  DataProviders
//
//  Created by Daniel Koster on 4/4/21.
//

import Combine
import Entities
import QuickHatch

protocol CountriesAPIProtocol {
    func get() -> AnyPublisher<[Country], Error>
    func get(code: String) -> AnyPublisher<[Country], Error>
    func get(name: String) -> AnyPublisher<[Country], Error>
}


class CountriesAPI: CountriesAPIProtocol, GenericAPI {
    var networkEnvironment: HostEnvironment
    private let networkClient: NetworkRequestFactory
    var path: String {
        networkEnvironment.baseURL + "/country"
    }
    
    init(networkEnvironment: HostEnvironment, networkClient: NetworkRequestFactory) {
        self.networkEnvironment = networkEnvironment
        self.networkClient = networkClient
    }
    
    func get() -> AnyPublisher<[Country], Error> {
        let request = try! URLRequest.get(url: path + "/all",
                                     encoding: URLEncoding.default,
                                     headers: networkEnvironment.headers)
        return networkClient.response(urlRequest: request)
    }
    
    func get(code: String) -> AnyPublisher<[Country], Error> {
        let request = try! URLRequest.get(url: path + "/code",
                                          params: ["code": code],
                                          encoding: URLEncoding.default,
                                          headers: networkEnvironment.headers)
        return networkClient.response(urlRequest: request)
    }
    
    func get(name: String) -> AnyPublisher<[Country], Error> {
        let request = try! URLRequest.get(url: path,
                                          params: ["name": name],
                                          encoding: URLEncoding.default,
                                          headers: networkEnvironment.headers)
        return networkClient.response(urlRequest: request)
    }
}
