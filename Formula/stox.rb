class Stox < Formula
  desc "Swift command-line tool to view and export tickers from finviz.com"
  homepage "https://github.com/xbladesub/stox"
  url "https://github.com/xbladesub/stox/archive/1.0.5.tar.gz"
  sha256 3daf00c3b8d5628bc716f5b8d708435070e3e7e5705d29beea40a26e6202489a
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
