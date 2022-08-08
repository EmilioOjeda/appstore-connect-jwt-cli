install:
	swift build -c release
	install .build/release/appstore-connect-jwt /usr/local/bin/appstore-connect-jwt
