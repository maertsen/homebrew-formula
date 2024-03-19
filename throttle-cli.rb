class ThrottleCli < Formula
  include Language::Python::Virtualenv

  desc "A small client-server utility, that throttles commands sent to it from multiple async sources."
  homepage "https://sr.ht/~ferdinandyb/throttle/"
  url "https://files.pythonhosted.org/packages/86/bc/575903c97222174b667830416ee1e3f2f6fdc18547b340eefeed1e2c27d8/throttle_cli-0.1.0.tar.gz"
  sha256 "45110448fef91c49aef7fde6d87693048d127dcbef9e8c46434e4d100f6d112f"
  license "EUPL-1.2"
  head "https://git.sr.ht/~ferdinandyb/throttle", branch: "master"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end
end

