class Octoswarm < Formula
  VERSION = "9.5.0"

  desc "Ops tool for managing docker swarm. Created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octoswarm/archive/v#{VERSION}.tar.gz"
  sha256 "903bdd67117a861a676be29797bfff4e7fca90f7caa49735668f1026d5515564"
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
