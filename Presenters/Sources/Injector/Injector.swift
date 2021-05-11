//
//  Injector.swift
//  Presenters
//
//  Created by Daniel Koster on 4/4/21.
//

import DataProviders

public extension CLCountryDashboardPresenter {
    convenience init() {
        self.init(dataProvider: CountriesDataProvider())
    }
}
