class RunOnMajor < Formula
  desc "Run a command on all servers in the major cluster, one by one"
  homepage "https://github.com/octoblu/ops-tools"
  url "https://github.com/octoblu/ops-tools/archive/v1.1.0.tar.gz"
  sha256 "b466d1a1697bbb62cce6f3c1b0ef87bb10f4e08492393efbed8e50ed0d9a7862"

  depends_on 'octoblu/tools/etcdsync'

  def install
    bin.install "bash/run_on_major"
  end

  test do
    system "#{bin}/run_on_major", "--version"
  end
end
