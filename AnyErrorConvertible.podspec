Pod::Spec.new do |spec|
  spec.name                  = "AnyErrorConvertible"
  spec.version               = "1.0.0"
  spec.summary               = "Help convert Error to any type."
  spec.homepage              = "https://github.com/nnsnodnb/AnyErrorConvertible"
  spec.swift_version         = "5.3"
  spec.license               = { :type => "MIT", :file => "LICENSE" }
  spec.author                = { "nnsnodnb" => "nnsnodnb@gmail.com" }
  spec.social_media_url      = "https://twitter.com/nnsnodnb"
  spec.platform              = :ios
  spec.ios.deployment_target = "9.0"
  spec.source                = { :git => "https://github.com/nnsnodnb/#{spec.name}.git", :tag => "#{spec.version}" }
  #spec.source_files          = "Source/#{spec.name}", "Sources/#{spec.name}/*.{h,swift}"
  spec.user_target_xcconfig  = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }
  spec.pod_target_xcconfig   = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }

  spec.default_subspec       = "AnyErrorConvertible"

  spec.subspec "AnyErrorConvertible" do |ss|
    ss.source_files = "Sources/AnyErrorConvertible/**/*"
  end

  spec.subspec "Action" do |ss|
    ss.source_files = "Sources/AnyErrorConvertibleAction/*.swift"
    ss.dependency "RxSwift"
    ss.dependency "Action"
    ss.dependency "AnyErrorConvertible/AnyErrorConvertible"
  end
end
