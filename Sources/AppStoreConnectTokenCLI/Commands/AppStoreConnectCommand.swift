import ArgumentParser

struct AppStoreConnectCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "appstore-connect-jwt",
        abstract: "The CLI allows generating JSON web tokens (a.k.a. JWTs) for the AppStore Connect API.",
        subcommands: [GenerateCommand.self])
}
