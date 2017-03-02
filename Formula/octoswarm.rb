class Octoswarm < Formula
  VERSION = "9.2.0"

  desc "Unix dev tools created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octoswarm/archive/v#{VERSION}.tar.gz"
  sha256 "28422ac5be203ef76d5be337ee37ee3981179d64fc128c6a4d8338a8a584b397"
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
