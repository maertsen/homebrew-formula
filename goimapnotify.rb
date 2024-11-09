# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Goimapnotify < Formula
  desc "Execute scripts on IMAP mailbox changes (new/deleted/updated messages) using IDLE, golang version."
  homepage "https://gitlab.com/shackra/goimapnotify"
  url "https://gitlab.com/shackra/goimapnotify/-/archive/2.4/goimapnotify-2.4.tar.gz"
  sha256 "9eb05ed81a508555e607d56c5ba6c5bb2212d527de82e6a3cf27dd99dd0cf2cd"
  license "GPL-3.0-or-later"
  head "https://gitlab.com/shackra/goimapnotify", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  service do
    run opt_bin/"goimapnotify"
    environment_variables PATH: std_service_path_env
    log_path "~/Library/Caches/goimapnotify/log"
    error_log_path "~/Library/Caches/goimapnotify/error_log"
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
