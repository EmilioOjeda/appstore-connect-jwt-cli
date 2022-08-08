import ArgumentParser

struct GenerateCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "generate",
        abstract: "It generates a valid JWT with the max expiration time allowed, which is 20 min.")

    @Option(
        name: .long,
        help: "The 'KeyID' of the active key to use - required.")
    private var keyId: String?

    @Option(
        name: .long,
        help: """
            The path to the auth key (.p8) that is related to the 'KeyID' - optional.

            When the option isn't passed/set, by default, it looks up for the standard file name ('AuthKey_{KeyID}.p8') at the current execution directory.
            If a directory is passed/set, it will look up for the standard file name ('AuthKey_{KeyID}.p8') at the given directory path.
            Otherwise, if the path to the file is passed/set, it will take this path as it is, allowing the use of renamed files.
            """)
    private var authKey: String?

    @Option(
        name: .long,
        help: "The 'IssuerID' of the creator of the authentication token - required.")
    private var issuerId: String?

    func run() throws {
        guard let issuerId = issuerId, !issuerId.isEmpty else {
            throw "The '--issuer-id' option is required."
        }

        guard let keyId = keyId, !keyId.isEmpty else {
            throw "The '--key-id' option is required."
        }

        let path = path(authKey: authKey, keyId: keyId)
        let file = try file(at: path)
        let data = try data(in: file)

        print(try jwt(keyId: keyId, authKey: data, issuerId: issuerId))
    }
}
