class Octofind < Formula
  VERSION = "1.0.0"

  desc "Ops tool for finding things octoswarm. Created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octofind/archive/v#{VERSION}.tar.gz"
  sha256 "2620bbaa530b3f1d4e509268b73b603d4193a0ca2620a04bafe04d290b9a23cc"
  depends_on 'jq'

  def install
    inreplace "octofind", 'directory="$(script_directory)"', ""
    inreplace "octofind", 'echo "unknown-version"', "echo '#{VERSION}'"

    bin.install "octofind"
  end

  test do
    assert_equal "#{VERSION}", shell_output("#{bin}/octofind --version").strip
  end
end
