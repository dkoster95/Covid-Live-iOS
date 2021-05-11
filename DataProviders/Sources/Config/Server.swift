//
//  Server.swift
//  DataProviders
//
//  Created by Daniel Koster on 4/4/21.
//

import QuickHatch

class Server: ServerEnvironmentConfiguration {
    var headers: [String : String] {
        return ["x-rapidapi-key": "2a43f79623mshf4fdf6bff2304adp1d0b56jsn3886a99edd6b",
                "x-rapidapi-host": "covid-19-data.p.rapidapi.com"]
    }
    
    var qa: HostEnvironment {
        GenericHostEnvironment(headers: headers,
                               baseURL: "https://covid-19-data.p.rapidapi.com")
        
    }
    
    var staging: HostEnvironment {
        GenericHostEnvironment(headers: headers,
                               baseURL: "https://covid-19-data.p.rapidapi.com")
        
    }
    
    var production: HostEnvironment {
        GenericHostEnvironment(headers: headers,
                               baseURL: "https://covid-19-data.p.rapidapi.com")
        
    }
    
    
}
