//
//  ViewController.swift
//  CovidLive
//
//  Created by Daniel Koster on 4/4/21.
//

import UIKit
import DataProviders
import Combine

class ViewController: UIViewController {
    var bag = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = CountriesDataProvider()
        api.search(query: "Italy").sink(receiveCompletion: { error in
            print(error)
        }, receiveValue: { value in
            print(value)
        }).store(in: &bag)
    }


}

