class AercNotmuch < Formula
  desc "Email client that runs in your terminal"
  homepage "https://aerc-mail.org/"
  url "https://git.sr.ht/~rjarry/aerc/archive/0.17.0.tar.gz"
  sha256 "a8a1af36b4d4989afd670601d83fc2088e14d804c66bd1e3bdd14561bd89c2cc"
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
