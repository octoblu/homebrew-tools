class Gump < Formula
  VERSION = "5.1.0"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools-gump/archive/v#{VERSION}.tar.gz"
  sha256 "1bf55413899d0bae614b460bb961f9e6e2e440b220ff9149972afa16e06c43b0"
  depends_on 'jq'
  depends_on 'hub'
  depends_on 'curl'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    inreplace "gump.sh", 'local directory="$(script_directory)"', ""
    inreplace "gump.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "gump.sh", "gump"

    bin.install "gump"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/gump --version").strip
  end
end
