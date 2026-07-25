import Foundation
import XCTest
@testable import SwiftMath

final class SwiftMathResourceBundleTests: XCTestCase {
    func testResolvesBundleFromApplicationResourcesBeforeFallback() {
        let moduleBundle = Bundle.module
        let resourcesURL = moduleBundle.bundleURL.deletingLastPathComponent()
        func unexpectedFallback() -> Bundle {
            XCTFail("Expected the application resource bundle to be preferred.")
            return .main
        }

        let resolved = SwiftMathResourceBundle.resolve(
            resourcesURL: resourcesURL,
            fallback: unexpectedFallback()
        )

        XCTAssertEqual(
            resolved.bundleURL.standardizedFileURL,
            moduleBundle.bundleURL.standardizedFileURL
        )
    }
}
