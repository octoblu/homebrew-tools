class Vulcansync < Formula
  desc "Sync vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools"
  url "https://github.com/octoblu/ops-tools/archive/v1.1.1.tar.gz"
  sha256 "426be929fd82fb57a098a15924cb850c7baef2d98335233912edd7e838bb1b8a"

  depends_on 'octoblu/tools/vctl'

  def install
    bin.install "bash/vulcansync"
  end

  test do
    assert_equal "v1.1.1", shell_output("#{bin}/vulcansync --version").strip
  end
end
