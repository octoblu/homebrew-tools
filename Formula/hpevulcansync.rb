class Hpevulcansync < Formula
  VERSION = "1.0.2"

  desc "Sync hpe vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools-hpehpevulcansync"
  url "https://github.com/octoblu/ops-tools-hpevulcansync/archive/v#{VERSION}.tar.gz"
  sha256 "436db9bee8dff9dfd63e268a11c01c576dd402dc7d24bb2803dcb47518f92a7d"

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
