Pod::Spec.new do |s|
  s.name         = "GesturePacker"
  s.version      = "0.1.0"
  s.summary      = "GesturePacker is get tap and gesture event."
  s.homepage     = "https://github.com/ikemai/GesturePacker"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ikemai" => "ikeda_mai@cyberagent.co.jp" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ikemai/GesturePacker.git", :tag => s.version.to_s }
  s.source_files  = "GesturePacker/**/*.{h,swift}"
  s.requires_arc = true
  s.frameworks = "UIKit"
end