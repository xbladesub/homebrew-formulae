class Stox < Formula
  desc "Swift command-line tool to view and export tickers from finviz.com"
  homepage "https://github.com/xbladesub/stox"
  url "https://github.com/xbladesub/stox/archive/1.0.3.tar.gz"
  sha256 "f1070f1f3fa060d30a7ce8a224fa874487d32ef7692156095f2bc2cefed897d2"
  license "MIT"

  depends_on xcode: "12.4"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc",
           "-cross-module-optimization", "--enable-test-discovery"
    bin.install ".build/release/stox"
  end

  test do
    (testpath/"test.swift").write <<~EOS
      import Foundation
    EOS
    assert_predicate testpath/"test.swift", :exist?
  end
end
