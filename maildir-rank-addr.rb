class MaildirRankAddr < Formula
  desc "Generates a ranked addressbook from a maildir folder. It can be used in MUA's like aerc or mutt by grepping the list."
  homepage "https://github.com/ferdinandyb/maildir-rank-addr"
  url "https://github.com/ferdinandyb/maildir-rank-addr/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "f28398765dd91aa4d0775fd1f7022dae5550c90919a2d84ba1d7d81370af283c"
  license "MIT"
  head "https://github.com/ferdinandyb/maildir-rank-addr", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=v#{version}")
  end

  test do
    system "#{bin}/maildir-rank-addr"
  end
end
