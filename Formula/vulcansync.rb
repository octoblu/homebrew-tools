class Vulcansync < Formula
  VERSION = "3.0.0"

  desc "Sync vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools-vulcansync"
  url "https://github.com/octoblu/ops-tools-vulcansync/archive/v#{VERSION}.tar.gz"
  sha256 "592dd96241ff8cfe841f001714f467e14e9519413b80e0a0c0894c4ab51704f8"

  depends_on 'octoblu/tools/vctl'

  def install
    inreplace "vulcansync.sh", 'local directory="$(script_directory)"', ""
    inreplace "vulcansync.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "vulcansync.sh", "vulcansync"

    bin.install "vulcansync"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/vulcansync --version").strip
  end
end
