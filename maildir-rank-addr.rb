class MaildirRankAddr < Formula
  desc "Generates a ranked addressbook from a maildir folder. It can be used in MUA's like aerc or mutt by grepping the list."
  homepage "https://github.com/ferdinandyb/maildir-rank-addr"
  url "https://github.com/ferdinandyb/maildir-rank-addr/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "a8a1af36b4d4989afd670601d83fc2088e14d804c66bd1e3bdd14561bd89c2cc"
  license "MIT"
  head "https://github.com/ferdinandyb/maildir-rank-addr", branch: "master"

  depends_on "go" => :build

  def install
    system "make", "PREFIX=#{prefix}", "VERSION=#{version}"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/maildir-rank-addr"
  end
end
