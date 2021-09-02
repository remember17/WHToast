

    Pod::Spec.new do |s|

    s.name        = "WHToast"

    s.version      = "0.0.9"

    s.summary      = "iOS Toast"

    s.homepage    = "https://github.com/remember17/WHToast"

    s.license      = "MIT"

    s.author      = { "wuhao" => "503007958@qq.com" }

    s.platform    = :ios, "11.0"

    s.source      = { :git => "https://github.com/remember17/WHToast.git", :tag => s.version }

    s.source_files  = "WHToast", "WHToast/*.{h,m}"

    s.framework  = "UIKit"

    s.resource   = 'WHToast/wtoast_icon/**'

    s.requires_arc = true

    end
