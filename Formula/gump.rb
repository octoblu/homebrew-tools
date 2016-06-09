class Gump < Formula
  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools/archive/v1.2.0.tar.gz"
  sha256 "86adb2d2ec4274d1e1ba8758382e3c6556dc636f396a3ad86edecb1d8d92d20c"
  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    bin.install "bash/gump"
  end

  test do
    assert_equal "v1.2.0", shell_output("#{bin}/gump --version").strip
  end
end
