class Gump < Formula
  VERSION = "1.4.0"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools-gump/archive/v#{VERSION}.tar.gz"
  sha256 "49c6c917696b6417aaac60ea6f939da4f8860622684ae6cefbb29a0b9b3aaf8d"
  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    inreplace "gump.sh", 'local directory="$(script_directory)"', ""
    inreplace "gump.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "gump.sh", "gump"

    bin.install "gump"
    info.install "VERSION"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/gump --version").strip
  end
end
