import Foundation

enum SwiftMathResourceBundle {
    static let bundleName = "SwiftMath_SwiftMath.bundle"

    static let module = resolve(
        resourcesURL: Bundle.main.resourceURL,
        fallback: Bundle.module
    )

    static func resolve(
        resourcesURL: URL?,
        fallback: @autoclosure () -> Bundle
    ) -> Bundle {
        if let resourcesURL {
            let bundledResourcesURL = resourcesURL
                .appendingPathComponent(bundleName, isDirectory: true)
            if let bundledResources = Bundle(url: bundledResourcesURL) {
                return bundledResources
            }
        }

        return fallback()
    }
}
