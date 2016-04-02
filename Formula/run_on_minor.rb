class RunOnMinor < Formula
  desc "Run a command on all servers in the minor cluster, one by one"
  homepage "https://github.com/octoblu/ops-tools"
  url "https://github.com/octoblu/ops-tools/archive/v1.1.1.tar.gz"
  sha256 "426be929fd82fb57a098a15924cb850c7baef2d98335233912edd7e838bb1b8a"

  depends_on 'octoblu/tools/etcdsync'

  def install
    bin.install "bash/run_on_minor"
  end

  test do
    assert_equal "v1.1.1", shell_output("#{bin}/run_on_minor --version").strip
  end
end
