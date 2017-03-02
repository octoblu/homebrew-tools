class Octoswarm < Formula
  VERSION = "9.1.2"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octoswarm/archive/v#{VERSION}.tar.gz"
  sha256 "990eec7fd83bc3ca0ccc08f754ef949945bda033b0bda6c9ad3a039b5c1e16a8"
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
