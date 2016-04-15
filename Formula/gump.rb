class Gump < Formula
  desc "Unix dev tools created by Octoblu"
  homepage "https://github.com/octoblu/unix-dev-tools"
  url "https://github.com/octoblu/unix-dev-tools/archive/v1.0.4.tar.gz"
  sha256 "9345fc5d4df5e663358bfe933c2564b42fee930f15baf91e6bf1666544ded5d4"

  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    bin.install "bash/gump"
  end

  test do
    assert_equal "v1.0.4", shell_output("#{bin}/gump --version").strip
  end
end
