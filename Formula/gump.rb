class Gump < Formula
  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools/archive/v1.1.0.tar.gz"
  version "1.1.0"
  sha256 "7e89874780b08502346158c5db13c91072ff0e3d10c4c7f77cba290cfca4429f"

  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    bin.install "bash/gump"
  end

  test do
    assert_equal "v1.1.0", shell_output("#{bin}/gump --version").strip
  end
end
