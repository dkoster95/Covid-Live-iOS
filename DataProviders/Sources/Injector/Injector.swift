//
//  Injector.swift
//  DataProviders
//
//  Created by Daniel Koster on 4/4/21.
//

import QuickHatch

public extension CountriesDataProvider {
    convenience init() {
        self.init(service: CountriesAPI(networkEnvironment: Server().staging,
                                        networkClient: QHRequestFactory(urlSession: URLSession.shared)))
    }
}
