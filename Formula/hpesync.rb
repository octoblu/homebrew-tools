class Hpesync < Formula
  VERSION = "1.0.2"

  desc "Sync etcd values to the hpe cluster"
  homepage "https://github.com/octoblu/ops-tools-hpesync"
  url "https://github.com/octoblu/ops-tools-hpesync/archive/v#{VERSION}.tar.gz"
  sha256 "5f29c549250a0aedf0a44f23422d74acb832620175c2d784a62ce39c3f2d9ffc"

  depends_on 'octoblu/tools/etcdsync'

  def install
    inreplace "hpesync.sh", 'local directory="$(script_directory)"', ""
    inreplace "hpesync.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "hpesync.sh", "hpesync"

    bin.install "hpesync"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/hpesync --version").strip
  end
end
