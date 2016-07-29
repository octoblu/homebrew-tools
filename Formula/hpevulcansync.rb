class Hpevulcansync < Formula
  VERSION = "1.0.0"

  desc "Sync hpe vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools-hpehpevulcansync"
  url "https://github.com/octoblu/ops-tools-hpevulcansync/archive/v#{VERSION}.tar.gz"
  sha256 "f2176949ac02eeabd141fcaeda40545456a6c4f0dbe152b85b9ba5a879021aed"

  depends_on 'octoblu/tools/vctl'

  def install
    inreplace "hpevulcansync.sh", 'local directory="$(script_directory)"', ""
    inreplace "hpevulcansync.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "hpevulcansync.sh", "hpevulcansync"

    bin.install "hpevulcansync"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/hpevulcansync --version").strip
  end
end
