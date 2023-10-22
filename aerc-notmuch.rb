class Aerc < Formula
  desc "Email client that runs in your terminal"
  homepage "https://aerc-mail.org/"
  url "https://git.sr.ht/~rjarry/aerc/archive/0.16.0.tar.gz"
  sha256 "b81b4f27272df2e370da377438a500c0695d29b8a4c86ff5849d6ddf3433f4db"
  license "MIT"
  head "https://git.sr.ht/~rjarry/aerc", branch: "master"

  depends_on "go" => :build
  depends_on "scdoc" => :build

  def install
    ENV["GOFLAGS"] = "-tags=notmuch"
    system "make", "PREFIX=#{prefix}", "VERSION=#{version}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/aerc", "-v"
  end
end
