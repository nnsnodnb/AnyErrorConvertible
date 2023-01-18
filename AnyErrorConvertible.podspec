Pod::Spec.new do |spec|
  spec.name                      = "AnyErrorConvertible"
  spec.version                   = "1.1.0"
  spec.summary                   = "Help convert Error to any type."
  spec.homepage                  = "https://github.com/nnsnodnb/AnyErrorConvertible"
  spec.swift_version             = "5.3"
  spec.license                   = { :type => "MIT", :file => "LICENSE" }
  spec.author                    = { "nnsnodnb" => "nnsnodnb@gmail.com" }
  spec.social_media_url          = "https://twitter.com/nnsnodnb"
  spec.platform                  = :ios
  spec.ios.deployment_target     = "11.0"
  spec.macos.deployment_target   = "10.14"
  spec.watchos.deployment_target = "6.0"
  spec.source                    = { :git => "https://github.com/nnsnodnb/#{spec.name}.git", :tag => "#{spec.version}" }

  spec.default_subspec           = "AnyErrorConvertible"

  spec.subspec "AnyErrorConvertible" do |ss|
    ss.source_files = "Sources/AnyErrorConvertible/**/*"
  end

  spec.subspec "Action" do |ss|
    ss.source_files = "Sources/AnyErrorConvertibleAction/*.swift"
    ss.dependency "RxSwift", "~> 6.5"
    ss.dependency "Action", "~> 5.0"
    ss.dependency "AnyErrorConvertible/AnyErrorConvertible"
  end
end
