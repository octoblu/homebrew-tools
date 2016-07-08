class Flog < Formula
  VERSION = "1.0.0"

  desc "fleetctl ssh into a machine containing a unit, then open the log file in a pager, starting at the end"
  url "https://github.com/octoblu/ops-tools-flog/archive/v#{VERSION}.tar.gz"
  sha256 "62700ef5c4ef8a71d1a2549453fa5a55c3b8d66231e9ff08281938d399df1ad3"
  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    inreplace "flog.sh", 'local directory="$(script_directory)"', ""
    inreplace "flog.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "flog.sh", "flog"

    bin.install "flog"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/flog --version").strip
  end
end
