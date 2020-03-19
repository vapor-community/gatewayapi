# GatewayAPI
[![Swift 5.2](https://img.shields.io/badge/swift-5.2-orange.svg?style=flat)](http://swift.org)
[![Vapor 4](https://img.shields.io/badge/vapor-4.0-blue.svg?style=flat)](https://vapor.codes)

`GatewayAPI` is a Vapor helper for using [GatewayAPIKit](https://github.com/vapor-community/GatewayAPIKit) to send text messages (SMS) to mobile phones.

## Installation
`GatewayAPI` is installed using Swift Package Manager, please modify your `Package.swift` to include the following code:

```swift
dependencies: [
    ...
    .package(url: "https://github.com/vapor-community/gatewayapi.git", from: "1.0.0-rc.1")
],
...
targets: [
    .target(
        name: ...
        dependencies: [
            ...
            .product(name: "GatewayAPI", package: "gatewayapi")
        ]
    )
]
```

## Usage
Make you sure you create an account over at [GatewayAPI](https://gatewayapi.com)

### Configuration 
In your `configure.swift` add one of the following configuration options:

```swift
import GatewayAPI

func configure(_ app: Application) throws {
    // Option 1: Use environment variable GATEWAYAPI_APIKEY
    app.gatewayAPI.configuration = .environment

    // Options 2: Manual config  
    app.gatewayAPI.configuration = .init(apiKey: "api_key")
}
```

### Sending a SMS
You can use the API client either through `Application` or `Request`

#### Application
```swift
import GatewayAPI

func configure(_ app: Application) throws {
    app.gatewayAPI.configuration = .environment

    _ = app.gatewayAPI.client.send("Text message": to: ["4510203040"], from: "Mads")
}
```

#### Request (inside controller)
```swift
import GatewayAPI

func sendSMS(req: Request) throws -> EventLoopFuture<Void> {
    return req.gatewayAPI.send("Text message": to: ["4510203040"], from: "Mads").transform(to: ())
}
```
