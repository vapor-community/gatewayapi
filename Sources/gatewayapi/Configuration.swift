import Vapor

public struct GatewayAPIConfiguration {
    public let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    /// Load `GATEWAYAPI_APIKEY` from environment variables
    public static var environment: GatewayAPIConfiguration {
        guard let apiKey = Environment.get("GATEWAYAPI_APIKEY"), !apiKey.isEmpty else {
            fatalError("Failed to load GatewayAPI configuration: GATEWAYAPI_APIKEY was not set in the environment variables")
        }
        
        return .init(apiKey: apiKey)
    }
}
