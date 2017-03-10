class Octoswarm < Formula
  VERSION = "9.3.0"

  desc "Ops tool for managing docker swarm. Created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octoswarm/archive/v#{VERSION}.tar.gz"
  sha256 "f1216ef7699b6b9a293f9c224fd9d7823f7bdd4dd05decc07b6528df5406d809"
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
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/octoswarm --version").strip
  end
end
