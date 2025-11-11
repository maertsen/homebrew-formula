# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Imapgoose < Formula
  desc "Keep local Maildir directories synchronised with an IMAP server."
  homepage "https://git.sr.ht/~whynothugo/ImapGoose"
  sha256 "9eb05ed81a508555e607d56c5ba6c5bb2212d527de82e6a3cf27dd99dd0cf2cd"
  license "ISC"
  head "https://git.sr.ht/~whynothugo/ImapGoose", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  service do
    run opt_bin/"imapgoose"
    environment_variables PATH: std_service_path_env
    log_path "~/Library/Caches/imapgoose/log"
    error_log_path "~/Library/Caches/imapgoose/error_log"
    keep_alive true
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test goimapnotify`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
