class Gump < Formula
  desc "Unix dev tools created by Octoblu"
  homepage "https://github.com/octoblu/unix-dev-tools"
  url "https://github.com/octoblu/unix-dev-tools/archive/v1.0.2.tar.gz"
  sha256 "928d5f447308476195706ae323f3b073b0d285995cf7324108fa0262461d9160"

  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    bin.install "bash/gump"
  end

  test do
    assert_equal "v1.0.2", shell_output("#{bin}/gump --version").strip
  end
end
