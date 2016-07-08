class Fssh < Formula
  VERSION = "1.0.0"

  desc "fleetctl ssh using a using a short command (fssh)"
  url "https://github.com/octoblu/ops-tools-fssh/archive/v#{VERSION}.tar.gz"
  sha256 "0194cc8bb04d027cf0b880c9d92f3a4f88b46cc2cb21d2df7f1a82ac14d38543"
  depends_on 'jq'
  depends_on 'coreutils'
  depends_on 'octoblu/tools/semver'

  def install
    inreplace "fssh.sh", 'local directory="$(script_directory)"', ""
    inreplace "fssh.sh", 'local version=$(cat "$directory/VERSION")', "local version=\"#{VERSION}\""

    move "fssh.sh", "fssh"

    bin.install "fssh"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/fssh --version").strip
  end
end
