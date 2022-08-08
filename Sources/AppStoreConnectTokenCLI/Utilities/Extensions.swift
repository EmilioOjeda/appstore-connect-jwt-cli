import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { self }
}

extension Optional {
    func or(_ fallback: @autoclosure () -> Wrapped) -> Wrapped {
        self ?? fallback()
    }
}
