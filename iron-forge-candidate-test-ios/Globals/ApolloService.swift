//
//  Apollo.swift
//  template-ios-test
//
//  Created by Andrew Daniel on 5/13/20.
//  Copyright © 2020 Iron Forge. All rights reserved.
//

import Foundation
import Apollo



class Apollo {
    
    private init() { }
    
    public static private(set) var client = { () -> ApolloClient in
        let transport = HTTPNetworkTransport(url: URL(string: "https://candidate-api-2020-03.ironforge.co/graphql")!)
        let client = ApolloClient(networkTransport: transport)
        
        client.cacheKeyForObject = {
            guard let typeName = $0["__typename"], let id = $0["id"] else { return nil }
            
            return "\(typeName)-\(id)"
        }
        
        return client
    }()

}
