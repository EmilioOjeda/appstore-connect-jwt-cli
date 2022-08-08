import Files
import Foundation
import AppStoreConnectToken

func fileName(for keyId: String) -> String {
    "AuthKey_\(keyId).p8"
}

func path(authKey: String?, keyId: String) -> String {
    authKey
        .map { path in
            path.isEmpty ? "." : path
        }
        .map { path in
            let components = path.components(separatedBy: "/")

            let lastComponent = components
                .last
                .map { lastComponent -> String in
                    guard lastComponent.hasSuffix(".p8") else {
                        return lastComponent
                            .appending("/\(fileName(for: keyId))")
                    }
                    return lastComponent
                }
                .or("./\(fileName(for: keyId))")

            return (components.dropLast() + [lastComponent])
                .joined(separator: "/")
        }
        .or("./\(fileName(for: keyId))")
}

func file(at path: String) throws -> File {
    do {
        return try File(path: path)
    } catch {
        throw "Cannot find any 'AuthKey' (.p8) at the path: '\(path)'."
    }
}

func data(in file: File) throws -> Data {
    do {
        return try file.read()
    } catch {
        throw "Cannot read the data in the '\(file.name)' file."
    }
}

func jwt(keyId: String, authKey: Data, issuerId: String) throws -> String {
    do {
        let tokenGenerator = AppStoreTokenGenerator(keyId: keyId, authKey: authKey, issuerId: issuerId)
        return try tokenGenerator.jwt()
    } catch {
        throw "Cannot generate the JWT."
    }
}
