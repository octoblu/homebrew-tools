class Gump < Formula
  desc "Unix dev tools created by Octoblu"
  homepage "https://github.com/octoblu/unix-dev-tools"
  url "https://github.com/octoblu/unix-dev-tools/archive/v1.0.0.tar.gz"
  sha256 "a930723e5cb08546024c6d2c440e7b1da1edc1664c6c70562dcecc56c1f726a8"

  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    bin.install "bash/gump"
  end

  test do
    assert_equal "v1.0.0", shell_output("#{bin}/gump --version").strip
  end
end
