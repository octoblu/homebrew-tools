class Hpesync < Formula
  VERSION = "1.0.4"

  desc "Sync etcd values to the hpe cluster"
  homepage "https://github.com/octoblu/ops-tools-hpesync"
  url "https://github.com/octoblu/ops-tools-hpesync/archive/v#{VERSION}.tar.gz"
  sha256 "7875594d9b294d121afd7a11b639a9ad5ce727df4d94f8eb027b16f35f4f4842"

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
