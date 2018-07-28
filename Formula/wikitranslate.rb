class Wikitranslate < Formula
    desc "Use Wikipedia as a dictionary"
    homepage "https://github.com/kiliankoe/WikiTranslate"
    url "https://github.com/kiliankoe/WikiTranslate/archive/0.1.1.tar.gz"
    sha256 "977af8fef5348b1750d579cf4d7c9c95aff34933b714532fc87193f9d7404328"
    head "https://github.com/kiliankoe/WikiTranslate.git"

    depends_on :xcode

    def install
        build_path = "#{buildpath}/.build/release/wt"
        ohai "Building WikiTranslate"
        system("swift build --disable-sandbox -c release --static-swift-stdlib")
        bin.install build_path
    end
end
