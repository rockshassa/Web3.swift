Pod::Spec.new do |s|
  s.name             = 'MagicSDK-Web3'
  s.version          = '1.0.2'
  s.summary          = 'Web3 library for Swift. Sign transactions and interact with Smart Contracts in the Ethereum Network.'

  s.description      = <<-DESC
Web3 library to sign transactions, interact with Smart Contracts, call
Smart Contract methods and many things more, all through either a
HTTP RPC interface provided by this library or a custom RPC interface
(for example IPC,...).
                       DESC

  s.homepage         = 'https://github.com/magicLabs/magic-web3-ios-pod'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Koray Koska' => 'koray@koska.at', 'Jerry Liu' => 'jerry@magic.link' }
  s.source           = { :git => 'https://github.com/magiclabs/magic-web3-ios-pod.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.12'

  s.swift_versions = '5.4'

  s.default_subspecs = 'Core', 'HTTPExtension'


s.subspec 'Core' do |ss|
    ss.source_files = 'Sources/Core/**/*'

    # Core dependencies
    ss.dependency 'BigInt', '~> 5.0'
    ss.dependency 'CryptoSwift', '1.3.8'
    ss.dependency 'secp256k1.swift', '~> 0.1'
  end

  s.subspec 'HTTPExtension' do |ss|
    ss.source_files = 'Sources/FoundationHTTP/**/*'

    ss.dependency 'MagicSDK-Web3/Core'
  end

  s.subspec 'PromiseKit' do |ss|
    ss.source_files = 'Sources/PromiseKit/**/*'

    ss.dependency 'MagicSDK-Web3/Core'
    # PromiseKit dependency
    ss.dependency 'PromiseKit/CorePromise', '~> 6.0'
  end

  s.subspec 'ContractABI' do |ss|
    ss.source_files = 'Sources/ContractABI/**/*'

    ss.dependency 'MagicSDK-Web3/Core'
  end

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
