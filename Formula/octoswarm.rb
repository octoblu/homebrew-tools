class Octoswarm < Formula
  VERSION = "9.1.0"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octoswarm/archive/v#{VERSION}.tar.gz"
  sha256 "0ed27881da68d4ae193c330cf2d3dba8b853d3ec95c415da0a4893f214c35819"
  depends_on 'jq'

  def install
    inreplace "octoswarm.sh", 'directory="$(script_directory)"', ""
    inreplace "octoswarm.sh", 'echo "unknown-version"', "echo '#{VERSION}'"

    move "octoswarm.sh", "octoswarm"
    move "octodocker.sh", "octodocker"
    move "octobash.sh", "octobash"
    move "octofish.sh", "octofish"
    move "octomachine.sh", "octomachine"
    move "octostack.sh", "octostack"

    bin.install "octoswarm"
    bin.install "octodocker"
    bin.install "octobash"
    bin.install "octofish"
    bin.install "octomachine"
    bin.install "octostack"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/octoswarm --version").strip
  end
end
