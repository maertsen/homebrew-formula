class Passage < Formula
  desc "Fork of password-store that uses age instead of GnuPG"
  homepage "https://github.com/FiloSottile/passage"
  url "https://github.com/FiloSottile/passage/archive/1.7.4a1.tar.gz"
  version "1.7.4a1"
  sha256 "0705ff409d4a6160ade347e63be623170da023ec199116dac83b406a18f7e0d7"
  license "GPL-2.0-or-later"
  head "https://github.com/FiloSottile/passage.git", branch: "main"

  depends_on "age"
  depends_on "gnu-getopt"
  depends_on "qrencode"
  depends_on "tree"

  def install
    system "make", "PREFIX=#{prefix}", "WITH_ALLCOMP=yes", "BASHCOMPDIR=#{bash_completion}",
                   "ZSHCOMPDIR=#{zsh_completion}", "FISHCOMPDIR=#{fish_completion}", "install"
    inreplace "#{bin}/passage",
              /^SYSTEM_EXTENSION_DIR=.*$/,
              "SYSTEM_EXTENSION_DIR=\"#{HOMEBREW_PREFIX}/lib/passage/extensions\""
  end

  test do
    (testpath/".passage").mkdir
    system Formula["age"].opt_bin/"age-keygen", "-o", ".passage/identities"
    system bin/"passage", "generate", "foo.bar"
    assert_predicate testpath/".passage/store/foo.bar.age", :exist?
  end
end
