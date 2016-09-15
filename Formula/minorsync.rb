class Minorsync < Formula
  VERSION = "2.0.1"

  desc "Sync etcd values to the minor cluster"
  homepage "https://github.com/octoblu/ops-tools-minorsync"
  url "https://github.com/octoblu/ops-tools-minorsync/archive/v#{VERSION}.tar.gz"
  sha256 "c6b7a54aca92427b0acef772e08f558c14c162e046f7d7285d24008283ba517c"

  depends_on 'octoblu/tools/etcdsync'

  def install
    inreplace "minorsync.sh", 'local directory="$(script_directory)"', ""
    inreplace "minorsync.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "minorsync.sh", "minorsync"

    bin.install "minorsync"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/minorsync --version").strip
  end
end
