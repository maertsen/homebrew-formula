class Passage < Formula
  desc "Fork of password-store that uses age instead of GnuPG"
  homepage "https://github.com/FiloSottile/passage"
  url "https://github.com/FiloSottile/passage/archive/1.7.4a2.tar.gz"
  version "1.7.4a2"
  sha256 "d4bd97be2eda4249b31c2042707ef70ba50385f6fb7791598f51be794168ee2c"
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
