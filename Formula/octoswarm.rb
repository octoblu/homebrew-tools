class Octoswarm < Formula
  VERSION = "9.1.1"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octoswarm/archive/v#{VERSION}.tar.gz"
  sha256 "177968a4c396fb41a70cd6a904b63cdf891cf544f47b7c1822361e3ea195538f"
  depends_on 'jq'

  def install
    inreplace "octoswarm", 'directory="$(script_directory)"', ""
    inreplace "octoswarm", 'echo "unknown-version"', "echo '#{VERSION}'"

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
