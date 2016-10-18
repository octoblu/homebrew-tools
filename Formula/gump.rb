class Gump < Formula
  VERSION = "3.1.2"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools-gump/archive/v#{VERSION}.tar.gz"
  sha256 "4a83dd473b3cb55ba15bca6a3e3ad9a269af877f77ebda1e3ba83c7446579293"
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
