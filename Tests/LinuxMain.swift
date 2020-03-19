import XCTest

import gatewayapiTests

var tests = [XCTestCaseEntry]()
tests += gatewayapiTests.allTests()
XCTMain(tests)
