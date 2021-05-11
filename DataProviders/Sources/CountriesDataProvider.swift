//
//  CountriesDataProvider.swift
//  DataProviders
//
//  Created by Daniel Koster on 4/4/21.
//

import Combine
import Entities

public protocol CountriesDataProviderProtocol {
    func search(query: String) -> AnyPublisher<[Country], Error>
}


public class CountriesDataProvider: CountriesDataProviderProtocol {
    public typealias Entity = Country
    private let service: CountriesAPIProtocol
    
    init(service: CountriesAPIProtocol) {
        self.service = service
    }
    
    public func search(query: String) -> AnyPublisher<[Country], Error> {
        return service.get(name: query)
    } 
    
}
