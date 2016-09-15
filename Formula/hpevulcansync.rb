class Hpevulcansync < Formula
  VERSION = "2.0.0"

  desc "Sync hpe vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools-hpehpevulcansync"
  url "https://github.com/octoblu/ops-tools-hpevulcansync/archive/v#{VERSION}.tar.gz"
  sha256 "c9d180915241d87522bc589240c3158f2d4c343beb10884f92150d759920e114"

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
