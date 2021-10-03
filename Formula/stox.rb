class Stox < Formula
  desc "Swift command-line tool to view and export tickers from finviz.com"
  homepage "https://github.com/xbladesub/stox"
  url "https://github.com/xbladesub/stox/archive/1.0.4.tar.gz"
  sha256 "0a803cb58688450bcc4be93ee80d8ad09247490c64a65eab717909ea88632d0c"
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
