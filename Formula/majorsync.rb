class Majorsync < Formula
  VERSION = "2.0.0"

  desc "Sync etcd values to the major cluster"
  homepage "https://github.com/octoblu/ops-tools-majorsync"
  url "https://github.com/octoblu/ops-tools-majorsync/archive/v#{VERSION}.tar.gz"
  sha256 "16b045e3da99fcc555f4ff2d7d3f43ca0676fb56b34948f55d12bb6d17b6520f"

  depends_on 'octoblu/tools/etcdsync'

  def install
    inreplace "majorsync.sh", 'local directory="$(script_directory)"', ""
    inreplace "majorsync.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "majorsync.sh", "majorsync"

    bin.install "majorsync"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/majorsync --version").strip
  end
end
