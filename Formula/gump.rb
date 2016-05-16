class Gump < Formula
  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools/archive/v1.1.1.tar.gz"
  version "1.1.1"
  sha256 "6db8e78bd0285a22718fb13a8e19bcc564c549be1dfe0d6e888abb97d4688891"
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
