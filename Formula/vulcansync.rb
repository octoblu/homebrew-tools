class Vulcansync < Formula
  VERSION = "4.0.0"

  desc "Sync vulcand frontends, backends, and middlewares to the major cluster"
  homepage "https://github.com/octoblu/ops-tools-vulcansync"
  url "https://github.com/octoblu/ops-tools-vulcansync/archive/v#{VERSION}.tar.gz"
  sha256 "cce37962b71d6e1b5529d22de3bd231c8664c72d45226c308be6c025d79e1585"

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
