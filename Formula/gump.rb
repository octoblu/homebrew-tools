class Gump < Formula
  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/unix-dev-tools-gump/archive/v1.3.0.tar.gz"
  sha256 "695055d3ca7fc294ed5c1d4d034b8f122937920c3e2a228f2714489d4e15bbff"
  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    inreplace "gump.sh", 'local directory="$(script_directory)"', ""
    inreplace "gump.sh", 'local version=$(cat "$directory/VERSION")', "local version=$(cat #{var}/VERSION)"

    move "gump.sh", "gump"

    bin.install "gump"
    var.install "VERSION"
  end

  test do
    assert_equal "v1.3.0", shell_output("#{bin}/gump --version").strip
  end
end
