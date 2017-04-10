class Octoswarm < Formula
  VERSION = "9.6.0"

  desc "Ops tool for managing docker swarm. Created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octoswarm/archive/v#{VERSION}.tar.gz"
  sha256 "bbb0214067f7bc7bd0b3ca79210d8af70fbc56fbda5c0cb32a5255bf4ff7feb9"
  depends_on 'jq'
  depends_on 'lolcat'

  def install
    inreplace "octoswarm", 'directory="$(script_directory)"', ""
    inreplace "octoswarm", 'echo "unknown-version"', "echo '#{VERSION}'"

    bin.install "octoswarm"
    bin.install "octodocker"
    bin.install "octobash"
    bin.install "octofish"
    bin.install "octomachine"
    bin.install "octostack"
    bin.install "octosen"
    bin.install "octoctop"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/octoswarm --version").strip
  end
end
