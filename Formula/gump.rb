class Gump < Formula
  VERSION = "1.4.1"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools-gump/archive/v#{VERSION}.tar.gz"
  sha256 "3e16f71a031437a0be9d5bb95259a0ce109ae693f801f83f88bc9546ce20fb84"
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
