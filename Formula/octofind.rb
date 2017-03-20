class Octofind < Formula
  VERSION = "1.1.0"

  desc "Ops tool for finding things octoswarm. Created by Octoblu"
  url "https://github.com/octoblu/ops-tools-octofind/archive/v#{VERSION}.tar.gz"
  sha256 "f01b1507eea367e09cd1d02e3b2253fa3581afc7d801e5d0211e4e30f52cac9e"
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
