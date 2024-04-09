class ThrottleCli < Formula
  include Language::Python::Virtualenv

  desc "A small client-server utility, that throttles commands sent to it from multiple async sources."
  homepage "https://sr.ht/~ferdinandyb/throttle/"
  url "https://files.pythonhosted.org/packages/44/5b/36b9e20ab42f024467cafb5ec5b6699d6ca2a464ccfa1fe3a68dbdd98e1d/throttle_cli-0.3.0.tar.gz"
  sha256 "2039339148cd8949dda7ae54d014487b6f98ae36e3a5703edd947ef55b3fdf89"
  license "EUPL-1.2"
  head "https://git.sr.ht/~ferdinandyb/throttle", branch: "master"

  depends_on "python"

  resource "jsonrpclib-pelix" do
    url "https://files.pythonhosted.org/packages/f5/10/839b1d2cbd6157e4b09d4499c849b48127cd1d761e1d5bfeb1522c8be50d/jsonrpclib-pelix-0.4.3.2.tar.gz"
    sha256 "e9e0b33efa8fa20d817dd78dfd9e4cdb3967c8a5d3cb5a783be1ee81c4a89c7c"
  end

  resource "prettytable" do
    url "https://files.pythonhosted.org/packages/19/d3/7cb826e085a254888d8afb4ae3f8d43859b13149ac8450b221120d4964c9/prettytable-3.10.0.tar.gz"
    sha256 "9665594d137fb08a1117518c25551e0ede1687197cf353a4fdc78d27e1073568"
  end

  resource "pyxdg" do
    url "https://files.pythonhosted.org/packages/b0/25/7998cd2dec731acbd438fbf91bc619603fc5188de0a9a17699a781840452/pyxdg-0.28.tar.gz"
    sha256 "3267bb3074e934df202af2ee0868575484108581e6f3cb006af1da35395e88b4"
  end

  resource "toml" do
    url "https://files.pythonhosted.org/packages/be/ba/1f744cdc819428fc6b5084ec34d9b30660f6f9daaf70eead706e3203ec3c/toml-0.10.2.tar.gz"
    sha256 "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/6c/63/53559446a878410fc5a5974feb13d31d78d752eb18aeba59c7fef1af7598/wcwidth-0.2.13.tar.gz"
    sha256 "72ea0c06399eb286d978fdedb6923a9eb47e1c486ce63e9b4e64fc18303972b5"
  end

  def install
    virtualenv_install_with_resources
  end

  service do
    run opt_bin/"throttle-server"
    environment_variables XDG_RUNTIME_DIR: ~/Library/Caches/TemporaryItems
  end

  test do
    system "#{bin}/throttle", "--status"
  end
end
