class Minorsync < Formula
  desc "Sync etcd values to the minor cluster"
  homepage "https://github.com/octoblu/ops-tools"
  url "https://github.com/octoblu/ops-tools/archive/v1.1.0.tar.gz"
  sha256 "b466d1a1697bbb62cce6f3c1b0ef87bb10f4e08492393efbed8e50ed0d9a7862"

  depends_on 'octoblu/tools/etcdsync'

  def install
    bin.install "bash/minorsync"
  end

  test do
    system "#{bin}/minorsync", "--version"
  end
end
