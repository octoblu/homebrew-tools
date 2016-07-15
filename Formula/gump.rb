class Gump < Formula
  VERSION = "2.1.2"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools-gump/archive/v#{VERSION}.tar.gz"
  sha256 "20759827059e7fd659572f3ddcdaf9ac4441862ac577fc817bb0aeee4f22ea00"
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
