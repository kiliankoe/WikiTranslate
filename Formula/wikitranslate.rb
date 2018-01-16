class Wikitranslate < Formula
    desc "Use Wikipedia as a dictionary"
    homepage "https://github.com/kiliankoe/WikiTranslate"
    url "https://github.com/kiliankoe/WikiTranslate/archive/0.1.0.tar.gz"
    sha256 "f2fcef3e577b2ed679d9f69490d585af2b97be0567c7baef481990e2ee15c36b"
    head "https://github.com/kiliankoe/WikiTranslate.git"

    depends_on :xcode

    def install
        build_path = "#{buildpath}/.build/release/wt"
        ohai "Building WikiTranslate"
        system("swift build --disable-sandbox -c release --static-swift-stdlib")
        bin.install build_path
    end
end
