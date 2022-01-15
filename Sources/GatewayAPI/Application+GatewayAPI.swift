import Vapor
import GatewayAPIKit

extension Application {
    public struct GatewayAPI {
        fileprivate let application: Application
        
        struct ConfigurationKey: StorageKey {
            typealias Value = GatewayAPIConfiguration
        }
        
        public var configuration: GatewayAPIConfiguration? {
            get {
                application.storage[ConfigurationKey.self]
            }
            nonmutating set {
                application.storage[ConfigurationKey.self] = newValue
            }
        }
        
        public var client: GatewayAPIClient {
            guard let configuration = configuration else {
                fatalError("GatewayAPI not configured, please use application.gatewayAPI.configuration = .environment in your configure function")
            }
            
            return .init(
                eventLoop: application.eventLoopGroup.next(),
                httpClient: application.http.client.shared,
                apiKey: configuration.apiKey
            )
        }
    }
    
    public var gatewayAPI: GatewayAPI { .init(application: self) }
}
