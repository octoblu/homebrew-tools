class Octoswarm < Formula
  VERSION = "9.4.0"

  desc "Ops tool for managing docker swarm. Created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octoswarm/archive/v#{VERSION}.tar.gz"
  sha256 "9026b8e4fa2e6fd15fae9bca29319a938b7c4c079fed62d8f4e9a50a7b78bb0c"
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
    bin.install "octosen"
    bin.install "octoctop"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/octoswarm --version").strip
  end
end
