//
//  CountryDashboardPresenter.swift
//  Presenters
//
//  Created by Daniel Koster on 4/4/21.
//

import DataProviders

public protocol CountryDashboardPresenter {
    
}

public class CLCountryDashboardPresenter: CountryDashboardPresenter {
    private let dataProvider: CountriesDataProviderProtocol
    
    init(dataProvider: CountriesDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    
}
