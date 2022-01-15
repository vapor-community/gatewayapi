import Vapor
import GatewayAPIKit

extension Request {
    public var gatewayAPI: GatewayAPIClient {
        guard let configuration = application.gatewayAPI.configuration else {
            fatalError("GatewayAPI not configured, please use application.gatewayAPI.configuration = .environment in your configure function")
        }
        
        return .init(
            eventLoop: self.eventLoop,
            httpClient: self.application.http.client.shared,
            apiKey: configuration.apiKey
        )
    }
}
