class Vulcansync < Formula
  desc "Sync vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools"
  url "https://github.com/octoblu/ops-tools/archive/vulcansync-v2.0.0.tar.gz"
  sha256 "47819e22109d16ba0712872ca8d0cb4619f130a6f0330863b0707fc5c8ef0dd0"

  depends_on 'octoblu/tools/vctl'

  def install
    bin.install "bash/vulcansync"
  end

  test do
    assert_equal "v1.1.1", shell_output("#{bin}/vulcansync --version").strip
  end
end
