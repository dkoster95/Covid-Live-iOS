//
//  Server.swift
//  DataProviders
//
//  Created by Daniel Koster on 4/4/21.
//

import QuickHatch
enum URLProtocols {
    case https(uri: String)
    
    var absoluteURL: String {
        switch self {
        case .https(uri: let uri): return "https://\(uri)"
        }
    }
}

class Server: ServerEnvironmentConfiguration {
    var headers: [String : String] {
        return ["x-rapidapi-key": ServerConfigReader.values.apiKey,
                "x-rapidapi-host": ServerConfigReader.values.host]
    }
    
    var qa: HostEnvironment {
        GenericHostEnvironment(headers: headers,
                               baseURL: URLProtocols.https(uri: ServerConfigReader.values.baseUrl).absoluteURL)
        
    }
    
    var staging: HostEnvironment {
        GenericHostEnvironment(headers: headers,
                               baseURL: URLProtocols.https(uri: ServerConfigReader.values.baseUrl).absoluteURL)
        
    }
    
    var production: HostEnvironment {
        GenericHostEnvironment(headers: headers,
                               baseURL: URLProtocols.https(uri: ServerConfigReader.values.baseUrl).absoluteURL)
        
    }
}

private class ServerConfigReader {
    static var values: ServerConfig {
        let data = try! PropertyListSerialization.data(fromPropertyList: Bundle.init(for: Server.self).infoDictionary!,
                                                      format: PropertyListSerialization.PropertyListFormat.binary,
                                                      options: 0)
        let plistDecoder = PropertyListDecoder()
        return try! plistDecoder.decode(ServerConfig.self, from: data)
    }
}

private struct ServerConfig: Decodable {
    let apiKey: String
    let host: String
    let baseUrl: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "API_KEY"
        case host = "HOST"
        case baseUrl = "BASE_URL"
    }
}
