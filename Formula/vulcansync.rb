class Vulcansync < Formula
  desc "Sync vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools"
  url "https://github.com/octoblu/ops-tools/archive/v1.1.0.tar.gz"
  sha256 "b466d1a1697bbb62cce6f3c1b0ef87bb10f4e08492393efbed8e50ed0d9a7862"

  depends_on 'octoblu/tools/vctl'

  def install
    bin.install "bash/vulcansync"
  end

  test do
    system "#{bin}/vulcansync", "--version"
  end
end
