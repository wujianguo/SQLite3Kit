# pod lib lint --verbose --allow-warnings sqlite3kit.podspec
# pod trunk push --verbose --allow-warnings sqlite3kit.podspec
Pod::Spec.new do |sqlite3kit|
  sqlite3kit.name         = "SQLite3Kit"
  sqlite3kit.version      = "1.0.0"
  sqlite3kit.summary      = "This is the copy of WCDB, which is a cross-platform database framework developed by WeChat."
  sqlite3kit.description  = <<-DESC
                      The WeChat Database, for Swift. (If you want to use WCDB for Objective-C, see the "WCDB" pod.)

                      WCDB is an efficient, complete, easy-to-use mobile database framework used in the WeChat application.
                      It can be a replacement for Core Data, SQLite & FMDB.
                      DESC
  sqlite3kit.homepage     = "https://github.com/wujianguo/SQLite3Kit"
  sqlite3kit.license      = { :type => "BSD", :file => "LICENSE" }
  sqlite3kit.author             = { "wujianguo" => "lsjustin89@gmail.com" }
  sqlite3kit.ios.deployment_target = "8.0"
  sqlite3kit.osx.deployment_target = "10.9"
  sqlite3kit.watchos.deployment_target = "2.0"
  sqlite3kit.tvos.deployment_target = "9.0"
  sqlite3kit.source       = { :git => "https://github.com/wujianguo/SQLite3Kit.git", :tag => sqlite3kit.version }
  sqlite3kit.source_files  = "source/**/*.swift", "source/**/**/*.swift", "source/util/*.{h,c}"
  sqlite3kit.module_name = "SQLite3Kit"
  sqlite3kit.requires_arc = true
  sqlite3kit.pod_target_xcconfig = { 
    "GCC_PREPROCESSOR_DEFINITIONS" => "SQLITE_HAS_CODEC WCDB_BUILTIN_SQLCIPHER",
    'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
    'APPLICATION_EXTENSION_API_ONLY' => 'YES',
    "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/SQLite3Kit",
    "LIBRARY_SEARCH_PATHS[sdk=macosx*]" => "$(SDKROOT)/usr/lib/system",
    "OTHER_SWIFT_FLAGS[config=Release][sdk=iphonesimulator*]" => "-D WCDB_IOS",
    "OTHER_SWIFT_FLAGS[config=Release][sdk=iphoneos*]" => "-D WCDB_IOS",
    "OTHER_SWIFT_FLAGS[config=Debug]" => "-D DEBUG",
    "OTHER_SWIFT_FLAGS[config=Debug][sdk=iphonesimulator*]" => "-D WCDB_IOS -D DEBUG",
    "OTHER_SWIFT_FLAGS[config=Debug][sdk=iphoneos*]" => "-D WCDB_IOS -D DEBUG",
  }
  sqlite3kit.swift_version = '4.2'
  sqlite3kit.dependency 'OptimizedSQLCipher'
  sqlite3kit.dependency 'SQLiteRepair'
end
