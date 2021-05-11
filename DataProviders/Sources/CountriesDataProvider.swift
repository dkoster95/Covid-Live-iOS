//
//  CountriesDataProvider.swift
//  DataProviders
//
//  Created by Daniel Koster on 4/4/21.
//

import Combine
import Entities

public protocol CountriesDataProviderProtocol {
    func getAll() -> AnyPublisher<[Country], Error>
    func search(query: String) -> AnyPublisher<[Country], Error>
}

public class CountriesDataProvider: CountriesDataProviderProtocol {
    private let service: CountriesAPIProtocol
    
    init(service: CountriesAPIProtocol) {
        self.service = service
    }
    
    public func getAll() -> AnyPublisher<[Country], Error> {
        return service.get()
    }
    
    public func search(query: String) -> AnyPublisher<[Country], Error> {
        return service.get(name: query)
    }
    
    
}
